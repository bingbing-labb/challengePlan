package com.scchallenge.controller.newPlan;

import java.io.Reader;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.ibatis.reflection.wrapper.BaseWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.comparator.Comparators;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.cloud.storage.Acl.User;
import com.scchallenge.service.newPlan.planService;
import com.scchallenge.vo.Admin;
import com.scchallenge.vo.Plan;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class planController {
	
	private planService planService;
	
	@RequestMapping("/scchallenge/newPlan")
	public ModelAndView newPlan(@RequestParam Map<String, Object> paramMap, ModelAndView mav, Locale locale) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		log.debug("@@@@@@@@@@@@@ new Plan requset");
		
		List<String> list = new ArrayList<>();
		
		list= planService.getAllPlan("0");
		
		int pid = 0;
		
		if(list != null && list.size() > 0) {
			list.sort(Comparator.reverseOrder());
			pid = Integer.parseInt(list.get(0))+1;
			log.debug("@@@@@@@@@@@ new pid : " + pid);
		}
		
		//insert new plan
		if(paramMap != null && paramMap.size() > 0) {
			log.debug("Exist param, param check : " + paramMap);
			if(paramMap.get("PlanTitle") == null) {
				mav.addObject("paramMap", paramMap);
				return mav;
			}
			
			//impl로 넘겨서 처리
			paramMap.put("Uid", "0");
			paramMap.put("Pid", String.valueOf(pid));
			paramMap.put("RegDate", sdf.format(new Date()));
			
			log.info("@@@@@@@@@@@@@ insert New Plan =====>" + paramMap);
			log.debug(planService.insertPlan(paramMap) + " || New Plan Added");
		}				
		
		paramMap.put("planlist", getFullList(list));
		
		log.debug("param check : " + paramMap);
		
		mav.addObject("paramMap", paramMap);
		return mav;
	}
	
	@RequestMapping("/plan/addPlan")
	public Map<String, Object> addPlan(@RequestParam Map<String,Object> paramMap) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String updateTime = planService.insertPlan((Map<String, Object>) paramMap.get("newPlan"));
			log.debug("new plan added | " +updateTime);
			log.debug("Parameter : " + paramMap.get("newPlan"));
		}catch (Exception e) {
			log.error(e.getMessage());
			resultMap.put("error", e.getMessage());
		}
		
		return resultMap;
	}
	
	@RequestMapping("/plan/updatePlan")
	public Map<String, Object> updatePlan(@RequestParam Map<String, Object> paramMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		try {
			for(String key :paramMap.keySet()) {
				resultMap.put(key, paramMap.get(key));
			}
			if(resultMap != null) {
				resultMap.put("UpdateDate", sdf.format(new Date()));
			}
			log.debug("prepare data for update plan no." + paramMap.get("Pid") + ":" + resultMap);
			
			log.debug("updatePlan complete : " + planService.updatePlan(resultMap));
			
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage());
			paramMap.put("err", e.getMessage());
		}
		return paramMap;
	}
	
	@ResponseBody
	@RequestMapping("/plan/getPlan")
	public Map<String, Object> getPlan(@RequestParam Map<String, Object> paramMap) throws Exception{		
		Plan plan = planService.getPlanDetail(paramMap.get("Pid").toString());
		
		return voToMap(plan);
	}
	
	public Map<String, Object> setPlanList(Map<String, Object> paramMap){
		
		return paramMap;
	}
	
	
	public List<Map<String, Object>> getFullList(List list) throws Exception {
		if(list == null || list.size() < 1) {
			return null;
		}
		List<Map<String, Object>> fList = new ArrayList<Map<String, Object>>();
		int pid = -1;
		
		for(Object each : list) {
			Plan plan = new Plan();
			
			plan = planService.getPlanDetail(each.toString());
			
			fList.add(voToMap(plan));
		}		
		return fList;
	}
	
	public Map<String, Object> voToMap(Object vo) throws Exception {
		Map<String, Object> eachPlan=new HashMap<String, Object>();
		
		for(Method method : vo.getClass().getMethods()) {
			String name = method.getName();
			if(name.startsWith("get") && !name.contains("Class")) {
				eachPlan.put(name.substring(3, name.length()), method.invoke(vo));
			}
		}
		log.debug(vo.getClass().getName() + " revert to Map Type : " + eachPlan);
		return eachPlan;
	}
}
