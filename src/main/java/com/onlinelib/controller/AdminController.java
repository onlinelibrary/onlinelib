package com.onlinelib.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onlinelib.model.Book;
import com.onlinelib.model.User;
import com.onlinelib.service.book.BookManagementService;
import com.onlinelib.service.user.UserManagementService;

@Controller
public class AdminController {

	@Autowired
	private BookManagementService bookManagementService;

	@Autowired
	private UserManagementService userManagementService;

	@RequestMapping(value = "/manageholds", method = RequestMethod.GET)
	public String manageholds(Model model, HttpServletRequest httpRequest) {
		return "admin/manageholds";
	}

	@RequestMapping(value = "/managecheckouts", method = RequestMethod.GET)
	public String managecheckouts(Model model, HttpServletRequest httpRequest) {
		return "admin/managecheckouts";
	}

	@RequestMapping(value = "/retrieveholds", method = RequestMethod.POST)
	public String updateholds(Model model, HttpServletRequest httpRequest) {
		User user = null;
		List<Book> books = new ArrayList<Book>();
		if(null!=httpRequest.getParameter("username")&&httpRequest.getParameter("username").trim().length()>0){
			user = userManagementService.findUserByUsername(httpRequest.getParameter("username").trim());
			if(user!=null){
				books = bookManagementService.findBooksOnHoldForUser(user.getId());
			}
		} else if (null != httpRequest.getParameter("allusers")
				&& httpRequest.getParameter("allusers").trim().length() > 0
				&& "all".equalsIgnoreCase(httpRequest.getParameter("allusers"))) {
			books = bookManagementService.findBooksOnHoldForAllUsers();
		}else if(null != httpRequest.getParameter("selecteddate")
				&& httpRequest.getParameter("selecteddate").trim().length() > 0){
			try{
				@SuppressWarnings("deprecation")
				Date selectedDate = new Date(httpRequest.getParameter("selecteddate").trim());
				books = bookManagementService.findBooksOnHoldUntilDate(selectedDate);			
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		model.addAttribute("results", books);
		return "admin/holdresults";
	}


	@RequestMapping(value = "/retrievecheckouts", method = RequestMethod.POST)
	public String retrievecheckouts(Model model, HttpServletRequest httpRequest) {
		User user = null;
		List<Book> books = new ArrayList<Book>();
		if(null!=httpRequest.getParameter("username")&&httpRequest.getParameter("username").trim().length()>0){
			user = userManagementService.findUserByUsername(httpRequest.getParameter("username").trim());
			if(user!=null){
				books = bookManagementService.findBooksCheckedOutByUser(user.getId());
			}
		} else if (null != httpRequest.getParameter("allusers")
				&& httpRequest.getParameter("allusers").trim().length() > 0
				&& "all".equalsIgnoreCase(httpRequest.getParameter("allusers"))) {
			books = bookManagementService.findBooksCheckedOutByAllUsers();
		}
		model.addAttribute("results", books);
		return "admin/checkoutresults";
	}

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String placehold(Model model, HttpServletRequest httpRequest, @RequestParam(value="book") Integer bookId) {

		Book book = bookManagementService.findBookById(bookId);
		
		book.setIsCheckedOut("Y");
		book.setIsAvailable("N");
		book.setCheckedOutTo(book.getOnHoldBy());
		Calendar today = Calendar.getInstance();
		today.add(Calendar.DATE, 10);
		book.setReturnDate(today.getTime());

		book.setIsOnHold("N");
		book.setOnHoldBy(null);
		book.setPickupDueDate(null);

		
		bookManagementService.updateBook(book);
		model.addAttribute("title", book.getTitle());
		model.addAttribute("returndate", today.getTime());
		return "admin/checkoutsuccess";
	}
	
	@RequestMapping(value = "/releaseholdbyadmin", method = RequestMethod.GET)
	public String releasehold(Model model, HttpServletRequest httpRequest, @RequestParam(value="book") Integer bookId) {
		Book book = bookManagementService.findBookById(bookId);
		book.setIsOnHold("N");
		book.setOnHoldBy(null);
		book.setIsCheckedOut("N");
		book.setIsAvailable("Y");
		book.setPickupDueDate(null);
		bookManagementService.updateBook(book);
		model.addAttribute("title",book.getTitle());
		return "admin/holdreleasesuccess";
	}	

	@RequestMapping(value = "/returnbook", method = RequestMethod.GET)
	public String returnbook(Model model, HttpServletRequest httpRequest, @RequestParam(value="book") Integer bookId) {
		String fine = null;
		Book book = bookManagementService.findBookById(bookId);
		Date returnedDate = new Date();
		if(returnedDate.after(book.getReturnDate())){
			Days daysForFine = Days.daysBetween(new DateTime(book.getReturnDate()).toLocalDate(),new DateTime(returnedDate.getTime()).toLocalDate());
			int amount = daysForFine.getDays();
			fine="$"+amount;
		}
		
		book.setIsCheckedOut("N");
		book.setIsAvailable("Y");
		book.setCheckedOutTo(null);
		book.setReturnDate(null);

		book.setIsOnHold("N");
		book.setOnHoldBy(null);
		book.setPickupDueDate(null);
		
		bookManagementService.updateBook(book);
		model.addAttribute("title", book.getTitle());
		model.addAttribute("fine", fine);
		
		return "admin/returnsuccess";
	}

	@RequestMapping(value = "/manageusers", method = RequestMethod.GET)
	public String manageusers(Model model, HttpServletRequest httpRequest) {
		return "admin/manageusers";
	}

	@RequestMapping(value = "/finduser", method = RequestMethod.POST)
	public String finduser(Model model, HttpServletRequest httpRequest) {
		User user =null;
		String username = httpRequest.getParameter("username");
		if(username!=null && username.trim().length()>0){
			user = userManagementService.findUserByUsername(httpRequest.getParameter("username"));
		}
		model.addAttribute("user", user);
		return "admin/userinfo";
	}

	@RequestMapping(value = "/updateuser", method = RequestMethod.POST)
	public String updateuser(Model model, HttpServletRequest httpRequest) {
		String firstName = httpRequest.getParameter("firstname");
		String lastName = httpRequest.getParameter("lastname");
		String email = httpRequest.getParameter("email");
		String status = "";
		User user = userManagementService.findUserByUsername(httpRequest
				.getParameter("username"));
		if (user != null && firstName != null && firstName.trim().length() > 0
				&& lastName != null && lastName.trim().length() > 0
				&& email != null && email.trim().length() > 0) {
			user.setFirstName(firstName.trim());
			user.setLastName(lastName.trim());
			user.setEmail(email.trim());
			user = userManagementService.updateUser(user);
			status = "success";
		} else {
			status = "failure";
		}
		model.addAttribute("user", user);
		model.addAttribute("status", status);
		return "admin/userupdatesuccess";
	}

	@RequestMapping(value = "/changeholddate", method = RequestMethod.POST)
	@ResponseBody
	public String changeholddate(Model model, HttpServletRequest httpRequest) {
		try {
		String book = httpRequest.getParameter("book");
		String dateString = httpRequest.getParameter("date");
		DateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		Date date;
			date = format.parse(dateString);
		Book bookToUpdate = bookManagementService.findBookById(Integer.valueOf(book));
		bookToUpdate.setPickupDueDate(date);
		bookManagementService.updateBook(bookToUpdate);
		} catch (ParseException e) {
			e.printStackTrace();
			return "failure";
		}catch(Exception ex){
			ex.printStackTrace();
			return "failure";
		}
		return "success";
	}
}
