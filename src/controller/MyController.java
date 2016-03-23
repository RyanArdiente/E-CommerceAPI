package controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
	@RequestMapping(path = "addToCart", method = RequestMethod.POST)
	public void addToCart(@RequestBody String json)
	{
		System.out.println("add to cart");
		System.out.println(json);
		mcdao.addToCart(json);
	}
	
	@ResponseBody
	@RequestMapping(path = "testProduct", method = RequestMethod.GET)
	public productsEntitie gettestProductd()
	{
		int id =65;
		System.out.println("int test Prodycuct route");
		return mcdao.getSingleProduct(id);
	}
	

	@ResponseBody
	@RequestMapping(path = "product/{id}", method = RequestMethod.GET)
	public productsEntitie getProductsById(@PathVariable int id)
	{

		System.out.println("int test Prodycuct route");
		return mcdao.getSingleProduct(id);
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
	
	@ResponseBody
	@RequestMapping(path = "search/{id}", method = RequestMethod.GET)
	public List<productsEntitie> searchProduct(@PathVariable String id)
	{
		System.out.println("in get categories "+id);
		return mcdao.searchProducts(id);
	}
}
