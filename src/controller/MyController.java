package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController {
	
	
	@ResponseBody
	@RequestMapping("ping")
	public String ping(){
		return "pong";
	}

}
