package com.scchallenge.service.newPlan;

import java.util.List;
import java.util.Map;

import com.scchallenge.vo.Plan;


public interface planService {
	public String insertPlan(Plan plan) throws Exception;
	public Map<String, Object> getPlanDetail(String pid) throws Exception;
	public List getPlan(String uid) throws Exception;
	public String updatePlan(Plan plan) throws Exception;
	public String deletePlan(String id) throws Exception; 

}
