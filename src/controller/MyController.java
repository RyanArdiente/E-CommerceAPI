package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import data.MCDAO;
import data.productsEntitie;
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
	@RequestMapping(path = "testProduct", method = RequestMethod.GET)
	public productsEntitie getTESTProductsBYID()
	{
		System.out.println("int test Prodycuct route");
		return mcdao.getTestProduct();
	}
}
