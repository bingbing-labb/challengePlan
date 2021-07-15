package com.scchallenge.service;

import static org.junit.Assert.assertNotNull;

import java.util.Date;
import java.util.Map;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.cglib.core.MethodWrapper;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.google.api.client.util.Key;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.cloud.FirestoreClient;
import com.scchallenge.config.RootConfig;
import com.scchallenge.service.newPlan.planService;
import com.scchallenge.service.newPlan.planServiceImpl;
import com.scchallenge.vo.Plan;

import lombok.*;
import lombok.extern.log4j.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes= {RootConfig.class})
@Log4j
public class PlanServiceTest {

	@Setter(onMethod_= {@Autowired})
	private planService service;
	
	
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() throws Exception{
		Firestore db = FirestoreClient.getFirestore();
		planServiceImpl impl = new planServiceImpl(db);
		int planCnt =(int)impl.getAdminDetail().getPlan();
		Plan plan = new Plan();
		plan.setDescription("for test");
		plan.setPid(String.valueOf(planCnt));
		plan.setPlanTitle("Test");
		plan.setUid("0");
		plan.setStartDate(new Date());
		plan.setEndDate(new Date());
		log.info("date test : " + plan.getStartDate() + "=>" + plan.getEndDate());
		plan.setRegDate(new Date());
		service.insertPlan(plan);
		log.info("생성된 게시물의 번호" + plan.getPid());
	}
	
	@Test
	public void testGetDetail() throws Exception {
		Map<String, Object> getDetail = service.getPlanDetail("2");
		log.info("=========================== test Get Detail");;
		getDetail.keySet().forEach(key -> log.info(key + ":"+ getDetail.get(key)));
//		service.getList(new Criteria(2,5)).forEach(service -> log.info(service));
	}
	
	@SuppressWarnings("unchecked")
	@Test
	public void testGetList() throws Exception {
		log.info("=========================== test Get List");;
		service.getPlan("0").forEach(pid ->{
			try {
				log.info(service.getPlanDetail(pid.toString()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
	}
	
	/*@Test
	public void testDelete() throws Exception {
		Firestore db = FirestoreClient.getFirestore();
		planServiceImpl impl = new planServiceImpl(db);
		log.info("=========================== test Delete");;
		int planCnt =(int)impl.getAdminDetail().getPlan();
		log.info("delete plan:"+planCnt +", updateTime :"+service.deletePlan(String.valueOf(planCnt)));
	}*/
	
	@Test
	public void testUpdate() throws Exception {
		Map<String, Object> planDetail = service.getPlanDetail("2");
		if (planDetail == null) {
			return;
		}
		planDetail.put("planTitle", "title changed!!!!!!");
//		변동 부분
//		log.info("Modified Result : " + service.updatePlan(plan));
//		BoardVO boardVO = service.get(1L);
		
//		if(boardVO == null) {
//			return;
//		}
		
//		boardVO.setTitle("제목을 수정합니다");
		
//		log.info("Modified result : "+ service.modify(boardVO));
	}
}
