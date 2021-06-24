package com.scchallenge.controller.newPlan;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scchallenge.controller.MainController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class planController {
	@RequestMapping("/scchallenge/*")
	@GetMapping("/newPlan")
	public void newPlan(Locale locale) {
		log.info(locale + " - newPlan(): 뷰와 연결");
	}
}
