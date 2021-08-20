package com.scchallenge.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.scchallenge.service.MainService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
//@RequestMapping("/scchallenge/*")
public class MainController {

	private MainService mainService;
	
	@RequestMapping(value="/scchallenge/main")
	public void main(Locale locale) {
		log.info(locale + " - main(): 뷰와 연결");
		log.debug("ck result : ");
	}
	
	@RequestMapping(value="/scchallenge/checkList")
	public void checkList() {
		
	}
	
	@ResponseBody
	@RequestMapping(value="/main/getUserPlan")
	public List<Map<String, Object>> getUserPlan(@RequestParam Map<String, Object> paramMap, ModelAndView mav) throws Exception {
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();

		result = mainService.getPlanMonthly(paramMap);
		
		log.debug("ck result : " + result);
		return result;
	}
}
