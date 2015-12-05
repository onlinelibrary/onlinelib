package com.onlinelib.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.onlinelib.model.User;
import com.onlinelib.repository.IUserRepository;

@Controller
public class RegistrationController {

	@Autowired
	private IUserRepository iUserRepository;

	@Autowired
	protected AuthenticationManager authenticationManager;

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(HttpServletRequest httpRequest) {
		return "account/signup";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(HttpServletRequest httpRequest) {
		User user = new User();
		String firstName = httpRequest.getParameter("firstname");
		String lastName = httpRequest.getParameter("lastname");
		String emailAddress = httpRequest.getParameter("email_address");
		String username = httpRequest.getParameter("email_address");
		String password = httpRequest.getParameter("password");
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmail(emailAddress);
		user.setUserName(username);
		user.setPassword(password);
		user.setRole("USER");
		User user2 = iUserRepository.save(user);
		if (user2 != null && user2.getId() > 0) {
			UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
			token.setDetails(new WebAuthenticationDetails(httpRequest));
			Authentication authenticatedUser = authenticationManager.authenticate(token);
			SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
		}
		return "redirect:portal";

	}

}
