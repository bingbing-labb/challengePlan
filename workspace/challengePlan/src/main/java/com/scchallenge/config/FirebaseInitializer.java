package com.scchallenge.config;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FirebaseInitializer {
	
	private String projectId = "scchallenge-5f3aa";
	@PostConstruct
	public void initializer() {
		
		try {
			InputStream firebaseAccount = 
					new FileInputStream("D:/git/min/challengePlan/workspace/challengePlan/src/main/resources/static/ScchallengePrivateKey.json");
			
			GoogleCredentials credentials = GoogleCredentials.fromStream(firebaseAccount);
			
			FirebaseApp firebaseApp = null;
			List<FirebaseApp> firebaseApps = FirebaseApp.getApps();
			
			if(firebaseApps != null && !firebaseApps.isEmpty()) {
				log.debug("firebaseApp is exist : " + firebaseApps);
				for(FirebaseApp app : firebaseApps) {
					if(app.getName().equals(FirebaseApp.DEFAULT_APP_NAME)) {
						firebaseApp = app;
						log.info("default app name =>" + app.getName());
					}
				}
			}else {
				FirebaseOptions options = new FirebaseOptions.Builder()
						.setCredentials(credentials)
						.setProjectId(projectId)
						.build();
				
				firebaseApp=FirebaseApp.initializeApp(options,"SCCHALLENGE");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
					
		
		
	}
}
