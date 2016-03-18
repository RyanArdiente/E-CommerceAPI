package controller;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@ResponseBody
	@RequestMapping(path = "createUser", method = RequestMethod.POST)
	public Boolean createUser(@RequestBody userEntitie newUser)
	{
		return mcdao.createUser(newUser);
	}
	
	@ResponseBody
	@RequestMapping(path = "login", method = RequestMethod.GET)
	public userEntitie login(@RequestBody String json)
	{
		return mcdao.login(json);
	}
	
	
}
