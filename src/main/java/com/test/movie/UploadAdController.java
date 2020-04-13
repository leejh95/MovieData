package com.test.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UploadAdController {

	@RequestMapping("/uploadAd.inc")
	public String uploadAd() {
		
		return "uploadAd";
	}
}
