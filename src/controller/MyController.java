package controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import data.MCDAO;
import data.userEntitie;



@Controller
public class MyController {
	@Autowired 
	private MCDAO mcdao;
	
	@ResponseBody
	@RequestMapping("ping")
	public String ping(){
		return "pong";
	}
	
	@ResponseBody
	@RequestMapping("user")
	public List<userEntitie> getUser() {
		System.out.println("inside get user rout");
		return mcdao.getAllUsers();
	}
	
	

}
