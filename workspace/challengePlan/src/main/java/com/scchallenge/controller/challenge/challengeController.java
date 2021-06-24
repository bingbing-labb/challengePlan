package com.scchallenge.controller.challenge;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/scchallenge/*")
@Log4j
@AllArgsConstructor
public class challengeController {

	@GetMapping("/challenge")
	public void challenge() {
		
	}
}
