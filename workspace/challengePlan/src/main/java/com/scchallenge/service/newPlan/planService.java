package com.scchallenge.service.newPlan;

import com.scchallenge.vo.Plan;


public interface planService {
	public String insertPlan(Plan plan) throws Exception;
	public Plan getPlanDetail(String pid) throws Exception;
	public String updatePlan(Plan plan) throws Exception;
	public String deletePlan(String id) throws Exception; 

}
