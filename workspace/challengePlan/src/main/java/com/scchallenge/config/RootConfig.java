package com.scchallenge.config;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.PostConstruct;

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

import lombok.extern.log4j.Log4j;

@Configuration
@ComponentScan(basePackages="com.scchallenge.service")
@Log4j
public class RootConfig {
	private String projectId = "scchallenge-5f3aa";

	@Bean
	public Firestore initFirebaseFirestore() throws IOException {
		log.debug("firebaseStore found ");
		Firestore db = FirestoreClient.getFirestore();
		/*try {
			InputStream firebaseAccount = 
					new FileInputStream("D:\\git\\min\\challengePlan\\workspace\\challengePlan\\src\\main\\resources\\static\\ScchallengePrivateKey.json");
			
			GoogleCredentials credentials = GoogleCredentials.fromStream(firebaseAccount);
			
			if(FirebaseApp.getApps().isEmpty()) {
				log.debug("firebaseApp is empty ");
				FirebaseOptions options = FirebaseOptions.builder()
						.setCredentials(credentials)
						.setDatabaseUrl("https://"+"SCCHALLENGE"+".firebaseio.com/")
//						.setProjectId(projectId)
						.build();
				
				FirebaseApp.initializeApp(options);
				System.out.print(FirebaseApp.getApps().get(0).getName());
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		return db;
	}
	
	@PostConstruct
	public void initializer() {
		
		try {
			InputStream firebaseAccount = 
					new FileInputStream("D:\\git\\min\\challengePlan\\workspace\\challengePlan\\src\\main\\resources\\static\\ScchallengePrivateKey.json");
			
			GoogleCredentials credentials = GoogleCredentials.fromStream(firebaseAccount);
			
			if(FirebaseApp.getApps().isEmpty()) {
				log.debug("firebaseApp is empty ");
				FirebaseOptions options = FirebaseOptions.builder()
						.setCredentials(credentials)
						.setDatabaseUrl("https://"+"SCCHALLENGE"+".firebaseio.com/")
//						.setProjectId(projectId)
						.build();
				
				FirebaseApp.initializeApp(options);
				System.out.print(FirebaseApp.getApps().get(0).getName());
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
					
		
		
	}

}
