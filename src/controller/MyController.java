package controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import data.MCDAO;
import data.productsEntitie;


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
	
	@ResponseBody
	@RequestMapping(path = "allProducts", method = RequestMethod.GET)
	public List<productsEntitie> getAllProducts()
	{
		System.out.println("in all products route");
		return mcdao.getAllProducts();
	}
	
	@ResponseBody
	@RequestMapping(path = "category/{cat}", method = RequestMethod.GET)
	public List<productsEntitie> getCategory(@PathVariable String cat)
	{
		System.out.println("in get categories "+cat);
		return mcdao.getCategories(cat);
	}
}
