package com.scchallenge.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import lombok.Data;

@Data
public class Plan {
	
	String PlanTitle;
	String Pid; //Member vo 짤때 plan 개수 challenge 개수 넣는 필드 만들기
	String Uid;
	String StartDate;
	String EndDate;
	String SubPlan;
	String Description;
	String RegDate;
	String UpdateDate;
}
