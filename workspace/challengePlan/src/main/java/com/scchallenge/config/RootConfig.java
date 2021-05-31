package com.scchallenge.config;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;

@Configuration
@ComponentScan(basePackages="com.scchallenge.service")
public class RootConfig {
	private String projectId = "scchallenge-5f3aa";

	@Bean
	public Firestore initFirebaseFirestore() throws IOException {
		InputStream firebaseAccount = new FileInputStream("D:/git/min/challengePlan/workspace/challengePlan/src/main/resources/static/ScchallengePrivateKey.json");
		
		GoogleCredentials credentials = GoogleCredentials.fromStream(firebaseAccount);
		FirebaseOptions options = new FirebaseOptions.Builder()
				.setCredentials(credentials)
				.setProjectId(projectId)
				.build();
		
		FirebaseApp.initializeApp(options); 		
		
		Firestore db = FirestoreClient.getFirestore();
		
		return db;
	}
	

}
