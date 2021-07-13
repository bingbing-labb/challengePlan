package com.scchallenge.vo;

import java.util.Date;
import java.util.Map;

public class Plan {
	
	String planTitle;
	String pid; //Member vo 짤때 plan 개수 challenge 개수 넣는 필드 만들기
	String uid;
	Date startDate;
	Date endDate;
	Map<String, Object> subPlan;
	String description;
	Date regDate;
	Date updateDate;
	
	public String getPlanTitle() {
		return planTitle;
	}
	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Map<String, Object> getSubPlan() {
		return subPlan;
	}
	public void setSubPlan(Map<String, Object> subPlan) {
		this.subPlan = subPlan;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
	
	
}
