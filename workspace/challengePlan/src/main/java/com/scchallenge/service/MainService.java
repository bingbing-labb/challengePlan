package com.scchallenge.service;

import java.util.List;
import java.util.Map;


public interface MainService {
	public List<Map<String, Object>> getPlanMonthly(Map<String, Object> paramMap) throws Exception;
//	public String deletePlan(String id) throws Exception; 
}
