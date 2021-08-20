package com.scchallenge.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.firebase.cloud.FirestoreClient;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MainServiceImpl implements MainService{

	public static final String COLLETION_NAME = "plan";
	private Firestore db = FirestoreClient.getFirestore();
	
	@Override
	public List<Map<String, Object>> getPlanMonthly(Map<String, Object> paramMap) throws Exception {

		List<Map<String, Object>> resultList = new ArrayList<>();
		
		
		String start = paramMap.get("start").toString();
		String end = paramMap.get("end").toString();
		
		ApiFuture<QuerySnapshot> montlyPlan=db.collection("Member").document("0").collection(COLLETION_NAME)
				.whereGreaterThanOrEqualTo("EndDate", start).get();
		List<QueryDocumentSnapshot> plans = montlyPlan.get().getDocuments();
		
		log.debug("Montly List check : " + plans);
		
		for(QueryDocumentSnapshot plan :plans) {
			Map<String, Object> result = new HashMap<String, Object>(); 
			//Integer.parseInt(plan.getId())
			result.put("pid", plan.get("Pid"));
			result.put("title", plan.get("PlanTitle"));
			result.put("start", plan.get("StartDate"));
			result.put("end", plan.get("EndDate"));
			if(plan.get("SubPlan") != null) {
				result.put("subPlan", plan.get("SubPlan"));
			}
			log.debug("added Montly List : " + result);
			resultList.add(result);
		}
		
		return resultList;
	}

}
