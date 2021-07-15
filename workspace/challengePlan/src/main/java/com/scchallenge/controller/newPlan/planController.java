package com.scchallenge.controller.newPlan;

import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scchallenge.controller.MainController;
import com.scchallenge.service.newPlan.planService;
import com.scchallenge.vo.Plan;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class planController {
	
	private planService planService;
	
	@RequestMapping("/scchallenge/*")
	@GetMapping("/main#newPlan")
	public ModelAndView newPlan(@RequestParam Map<String, Object> paramMap, ModelAndView mav, Locale locale) throws Exception{
		Plan plan = new Plan();
		
		plan=planService.getPlanDetail("2");
		
		if(plan != null) {
			paramMap.put("title", plan.getPlanTitle());
			paramMap.put("endDate", plan.getEndDate());
		}
		log.debug("user plan List : " + paramMap);
		mav.addObject("planList", paramMap);
		log.debug("user plan List in mav : " + mav);
		return mav;
	}
}
