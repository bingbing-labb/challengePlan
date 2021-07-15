package com.scchallenge.vo;

import java.util.Date;
import java.util.Map;

import lombok.Data;

@Data
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
}
