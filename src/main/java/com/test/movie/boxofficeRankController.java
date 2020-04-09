package com.test.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class boxofficeRankController {

	@RequestMapping("/boxofficeRank.inc")
	public String boxofficeRank() {
		return "boxoffice_rank";
	}
}
