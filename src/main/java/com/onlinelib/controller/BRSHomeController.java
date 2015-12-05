package com.onlinelib.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.onlinelib.model.User;
import com.onlinelib.service.book.BookManagementService;

@Controller
public class BRSHomeController {
	
	@Autowired
	private BookManagementService bookManagementService;

	private static final String USER_PORTAL = "portal";
	private static final String ADMIN_PORTAL = "adminportal";
	
	
	@RequestMapping(value = "/portal", method = RequestMethod.GET)
	public String getList(HttpServletRequest httpRequest, Model model) {
		String portalPage = USER_PORTAL;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) auth.getPrincipal();
		
		int numberOfBooksCheckedOut = bookManagementService.findBooksCheckedOutByUser(user.getId()).size();
		int numberOfBooksOnHold = bookManagementService.findBooksOnHoldForUser(user.getId()).size();
		
		model.addAttribute("displayname", user.getFullName());
		model.addAttribute("checkouts", numberOfBooksCheckedOut);
		model.addAttribute("holds", numberOfBooksOnHold);
		if(user.getRole().equalsIgnoreCase("ADMIN")){
			portalPage=ADMIN_PORTAL;
		}
		return portalPage;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "account/login";
	}

	@RequestMapping(value = "/accessdenied", method = RequestMethod.GET)
	public String loginerror(Model model) {
		model.addAttribute("error", "true");
		return "account/denied";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		return "account/logout";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String error(Model model) {
		return "error";
	}

	@RequestMapping(value = "/contactus", method = RequestMethod.GET)
	public String contactus(Model model) {
		return "account/contactus";
	}
}
