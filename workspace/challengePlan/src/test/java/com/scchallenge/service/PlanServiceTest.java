package com.scchallenge.service;

import static org.junit.Assert.assertNotNull;

import java.util.Date;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.cglib.core.MethodWrapper;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.scchallenge.config.RootConfig;
import com.scchallenge.service.newPlan.planService;
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
		Plan plan = new Plan();
		plan.setDescription("for test");
		plan.setPid("0");
		plan.setPlanTitle("Test");
		plan.setUid("0");
		plan.setStartDate(new Date());
		plan.setEndDate(new Date(2));
		log.info("date test : " + plan.getStartDate() + "=>" + plan.getEndDate());
		plan.setRegDate(new Date());
		service.insertPlan(plan);
		log.info("생성된 게시물의 번호" + plan.getPid());
	}
	
	@Test
	public void testGetList() {
//		service.getList(new Criteria(2,5)).forEach(service -> log.info(service));
	}
	
	@Test
	public void testGet() {
//		log.info(service.get(5L));
	}
	
	@Test
	public void testDelete() throws Exception {
//		log.info("delete plan: update time : "+service.deletePlan(String.valueOf(1)));
	}
	
	@Test
	public void testUpdate() {
//		BoardVO boardVO = service.get(1L);
		
//		if(boardVO == null) {
//			return;
//		}
		
//		boardVO.setTitle("제목을 수정합니다");
		
//		log.info("Modified result : "+ service.modify(boardVO));
	}
}
