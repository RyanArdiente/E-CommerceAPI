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
		ObjectMapper mapper = new ObjectMapper();
		userEntitie user;
		try
		{
			user = mapper.readValue(json, userEntitie.class);
			String email = user.getEmail();
 			String password = user.getPassword();
 			
			userEntitie checkUser = mcdao.getUserByEmail(email);
			if (checkUser.getEmail().equals(email) && checkUser.getPassword().equals(password))
			{
				return user;
			}
		} 
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
}
