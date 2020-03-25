package com.test.movie;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SignOutController {

	@Autowired
	HttpSession session;
	
	@RequestMapping("/signout.inc")
	public String session() {
		session.removeAttribute("memVO");
		return "index";
	}
}
