package com.scchallenge.service.newPlan;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.Precondition;
import com.google.cloud.firestore.Query;
import com.google.cloud.firestore.Query.Direction;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import com.scchallenge.vo.Admin;
import com.scchallenge.vo.Plan;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class planServiceImpl implements planService{
	
	public static final String COLLETION_NAME = "plan";
	private Firestore db = FirestoreClient.getFirestore();
	
	@Override
	public String insertPlan(Map<String, Object> paramMap) throws Exception {
		
		ApiFuture<WriteResult>result=db.collection("Member").document("0").collection(COLLETION_NAME).document(paramMap.get("Pid").toString()).set(paramMap);
//		int cnt = Integer.parseInt(paramMap.get("Pid").toString())
		int cnt = getAllPlan(paramMap.get("Uid").toString()).size();
		log.debug("update admin plan data : " +  updateAdminData(cnt));
		log.info("new Plan added: plan no."+paramMap.get("Pid") + "==>" + paramMap.get("Uid") + ":" +paramMap.get("PlanTitle"));
		
		//Memeber.update("planNum") : 처리
		return result.get().getUpdateTime().toString();
	}

	@Override
	public List<String> getAllPlan(String uid) throws Exception {
		List<String> pidList = new ArrayList<>();
		ApiFuture<QuerySnapshot> allPlan = db.collection("Member").document(uid).collection(COLLETION_NAME).orderBy("EndDate", Direction.DESCENDING).get();
		
		List<QueryDocumentSnapshot> plans = allPlan.get().getDocuments();
		
		for(QueryDocumentSnapshot plan : plans) {
			pidList.add(plan.getId());
		}
		
		return pidList;
	}
	
	@Override
	public Plan getPlanDetail(String pid) throws Exception {
		DocumentReference def = null;
		Plan plan = new Plan();
		
		try {
			 def = db.collection("Member").document("0").collection(COLLETION_NAME).document(pid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		if(def != null) {
			ApiFuture<DocumentSnapshot> apiFuture = def.get();
			DocumentSnapshot dSnapshot = apiFuture.get();
			
			if(dSnapshot.exists()) {
				plan = dSnapshot.toObject(Plan.class);
			}
			
		}
		return plan;
	}

	@Override
	public String updatePlan(Map<String, Object> plan) throws Exception {
		try {
			ApiFuture<WriteResult> apiFuture = db.collection("Member").document("0").collection(COLLETION_NAME).document(plan.get("Pid").toString()).update(plan);
		
			log.debug("plan Updated : " + plan.get("Pid") + ":" +plan.get("PlanTitle"));
			return apiFuture.get().getUpdateTime().toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "err";
		}
	}

	@Override
	public String deletePlan(String id) throws Exception {
		try {
			ApiFuture<WriteResult> apiFuture =  db.collection("Member").document("0").collection(COLLETION_NAME).document(id).delete();
			log.debug("plan Deleted : id = "+id);
			
			return apiFuture.get().getUpdateTime().toString();
			
		} catch (Exception e) {
			e.printStackTrace();
			return "err-404";
		}
		
	}
	
	public Map<String, Object> updateAdminData(int planCnt) throws Exception {
		
		log.debug("updateAdminData start");
		
		Map<String, Object> data = new HashMap<>();
		data.put("planCnt", planCnt+1);
		
		 db.collection("Member").document("0").collection(COLLETION_NAME).document("admin").update(data);
//		 db.collection("admin").document("ver0").update(data); //admin.update 만들어서 넣기
	
		return data;
	}
	
	public String planCnt() throws Exception{
		String cnt = (String) db.collection("admin").document("ver0").get().get().get("planCnt");
		return cnt;
	}


}
