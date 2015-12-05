package com.onlinelib.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.onlinelib.model.Book;
import com.onlinelib.model.User;
import com.onlinelib.service.book.BookManagementService;

@Controller
public class BookManagementController {

	@Autowired
	private BookManagementService bookManagementService;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model model) {
		return "books/search";
	}

	@RequestMapping(value = "/dosearch", method = RequestMethod.POST)
	public String dosearch(Model model, HttpServletRequest httpRequest) {
		String title = "";
		if(httpRequest.getParameter("title")!=null){
			title = httpRequest.getParameter("title");
			title = "%"+title+"%";
		}
		List<Book> books = bookManagementService.findBooksByTitle(title);
		model.addAttribute("results", books);
		return "books/searchresults";
	}
	
	@RequestMapping(value = "/showall", method = RequestMethod.POST)
	public String showall(Model model, HttpServletRequest httpRequest) {
		List<Book> books = bookManagementService.findAll();
		model.addAttribute("results", books);
		return "books/searchresults";
	}

	@RequestMapping(value = "/placehold", method = RequestMethod.GET)
	public String placehold(Model model, HttpServletRequest httpRequest, @RequestParam(value="book") Integer bookId) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal();

		Book book = bookManagementService.findBookById(bookId);
		book.setIsOnHold("Y");
		book.setOnHoldBy(user.getId());
		book.setIsCheckedOut("N");
		book.setIsAvailable("N");
		Calendar today = Calendar.getInstance();
		today.add(Calendar.DATE, 10);
		book.setPickupDueDate(today.getTime());
		bookManagementService.updateBook(book);
		model.addAttribute("title", book.getTitle());
		model.addAttribute("pickupdate", today.getTime());
		return "books/holdsuccess";
	}

	@RequestMapping(value = "/showallholds", method = RequestMethod.GET)
	public String showaholds(Model model, HttpServletRequest httpRequest) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal();
		List<Book> books = bookManagementService.findBooksOnHoldForUser(user.getId());
		model.addAttribute("results", books);
		return "books/holdresults";
	}

	@RequestMapping(value = "/releasehold", method = RequestMethod.GET)
	public String releasehold(Model model, HttpServletRequest httpRequest, @RequestParam(value="book") Integer bookId) {
		Book book = bookManagementService.findBookById(bookId);
		book.setIsOnHold("N");
		book.setOnHoldBy(null);
		book.setIsCheckedOut("N");
		book.setIsAvailable("Y");
		book.setPickupDueDate(null);
		bookManagementService.updateBook(book);
		model.addAttribute("title",book.getTitle());
		return "books/holdreleasesuccess";
	}
	
	@RequestMapping(value = "/showallcheckouts", method = RequestMethod.GET)
	public String showallcheckouts(Model model, HttpServletRequest httpRequest) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal();
		List<Book> books = bookManagementService.findBooksCheckedOutByUser(user.getId());
		model.addAttribute("results", books);
		return "books/checkoutresults";
	}
	
}
