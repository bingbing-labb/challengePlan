package com.scchallenge.service.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firestore.v1beta1.Write;
import com.scchallenge.vo.Admin;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	private final String COLLECTION_NAME="admin";
	
	@Setter(onMethod_= {@Autowired})
	private Firestore db;
	@Override
	public String updateAdmin(Admin admin) throws Exception {
		ApiFuture<WriteResult> apiFuture = db.collection(COLLECTION_NAME).document("ver0").set(admin);
		log.debug("admin updated : Member = " + admin.getMember() + ", Plan:" + admin.getPlan());
		return apiFuture.get().getUpdateTime().toString();
	}
	

}
