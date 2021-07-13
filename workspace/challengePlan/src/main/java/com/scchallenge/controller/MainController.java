package com.scchallenge.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/scchallenge/*")
@Log4j
@AllArgsConstructor
public class MainController {
	//private MainService mainService;
	
	/*@GetMapping("/main")
	public void main(Locale locale) {
		log.info(locale + " - main(): 뷰와 연결");
	}
	*/
}
