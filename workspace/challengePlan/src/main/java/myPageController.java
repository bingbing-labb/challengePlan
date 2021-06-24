import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scchallenge.controller.newPlan.planController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/scchallenge/*")
@AllArgsConstructor
public class myPageController {
	
	@GetMapping("/myPage")
	public void myPage() {
		log.info("myPage is ON");
	}
	
	@RequestMapping("/myPage")
	public Map<String, Object> updateUserInfo() {
		
		return null;
	}
}
