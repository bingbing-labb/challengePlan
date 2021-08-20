package com.scchallenge.service.newPlan;

import java.util.List;
import java.util.Map;

import com.scchallenge.vo.Plan;


public interface planService {
	public String insertPlan(Map<String, Object> plan) throws Exception;
	public Plan getPlanDetail(String pid) throws Exception;
	public List<String> getAllPlan(String uid) throws Exception;
	public String updatePlan(Map<String, Object> plan) throws Exception;
	public String deletePlan(String id) throws Exception; 
	public String planCnt() throws Exception;

}
