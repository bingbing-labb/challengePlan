package com.scchallenge.service.Member;


import org.springframework.stereotype.Service;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.cloud.FirestoreClient;
import com.scchallenge.vo.Member;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private static final String COLLECTION_NAME = "Member";
	private final Firestore db=FirestoreClient.getFirestore();
	
	@Override
	public String insertMember(Member member) throws Exception{

		ApiFuture<WriteResult> apiFuture = db.collection(COLLECTION_NAME).document(member.getUid()).set(member);
		log.debug("Member Inserted" + member.getUid() + " = >" + member);
		
		return apiFuture.get().getUpdateTime().toString();
	}

	@Override
	public Member getMemberDetail(String uid) throws Exception{
		DocumentReference def= db.collection(COLLECTION_NAME).document(uid);
		ApiFuture<DocumentSnapshot> apiFuture = def.get();
		DocumentSnapshot dSnapshot = apiFuture.get();
		Member member = null;
		
		if(dSnapshot.exists()) {
			member  = dSnapshot.toObject(Member.class);
			log.debug("member info requested : " + member);
			return member;
		}else {
			return null;
		}
	}

	@Override
	public String updateMember(Member member) throws Exception{
		ApiFuture<WriteResult> apiFuture = db.collection(COLLECTION_NAME).document(member.getUid()).set(member);
		log.debug("Member Updated" + member.getUid() + " = >" + member);
		
		return apiFuture.get().getUpdateTime().toString();
	}

	@Override
	public String deleteMember(String uid) throws Exception {
		ApiFuture<WriteResult> apiFuture = db.collection(COLLECTION_NAME).document(uid).delete();
		log.debug("user Deleted : id = "+uid);
		return apiFuture.get().getUpdateTime().toString();
	}

}
