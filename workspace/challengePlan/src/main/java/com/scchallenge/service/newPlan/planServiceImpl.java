package com.scchallenge.service.newPlan;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
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
	public String insertPlan(Plan plan) throws Exception {
		int planCnt = (int) getAdminDetail().getPlan();
		
		ApiFuture<WriteResult>result=db.collection(COLLETION_NAME).document(String.valueOf(planCnt+1)).set(plan);
		
		log.debug("update admin plan data : " + updateAdminData());
		
		log.info("new Plan added: plan no."+planCnt + "==>" + plan.getUid() + ":" +plan.getPlanTitle());
		
		return result.get().getUpdateTime().toString();
	}

	@Override
	public Plan getPlanDetail(String pid) throws Exception {
		DocumentReference def = db.collection(COLLETION_NAME).document(pid);
		ApiFuture<DocumentSnapshot> apiFuture = def.get();
		DocumentSnapshot dSnapshot = apiFuture.get();
		
		Plan plan = null;
		if(dSnapshot.exists()) {
			plan = dSnapshot.toObject(Plan.class);
			return plan;
		}
		return null;
	}

	@Override
	public String updatePlan(Plan plan) throws Exception {
		ApiFuture<WriteResult> apiFuture =db.collection(COLLETION_NAME).document(plan.getPid()).set(plan);
		
		log.debug("plan Updated : " + plan.getUid() + ":" +plan.getPlanTitle());
		return apiFuture.get().getUpdateTime().toString();
	}

	@Override
	public String deletePlan(String id) throws Exception {
		ApiFuture<WriteResult> apiFuture = db.collection(COLLETION_NAME).document(id).delete();
		log.debug("plan Deleted : id = "+id);
		return apiFuture.get().getUpdateTime().toString();
	}
	
	public Admin getAdminDetail() throws Exception{

		DocumentSnapshot dSnapshot =  getAdminFromDB();
		
		Admin admin = new Admin();
	
		if(dSnapshot.exists()) {
			admin  = dSnapshot.toObject(Admin.class);
			return admin;
		}else {
			return null;
		}
	}
	
	public Map<String, Object> updateAdminData() throws Exception {
		log.debug("updateAdminData start");
		int plan = getAdminDetail().getPlan();
		Map<String, Object> data = new HashMap<>();
		data.put("plan", plan+1);
		
		db.collection("admin").document("ver0").update(data);
		
		return data;
	}

	public DocumentSnapshot getAdminFromDB() throws Exception{
		DocumentReference def= db.collection("admin").document("ver0");
		ApiFuture<DocumentSnapshot> apiFuture = def.get();
		DocumentSnapshot dSnapshot = apiFuture.get();
		
		return dSnapshot;
	}
}
