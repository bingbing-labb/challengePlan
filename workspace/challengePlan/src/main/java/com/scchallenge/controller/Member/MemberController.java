package com.scchallenge.controller.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scchallenge.controller.MainController;
import com.scchallenge.service.Member.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/scchallenge/*")
@Log4j
@AllArgsConstructor
public class MemberController {

	@Autowired
	MemberService memberService;
	
}
