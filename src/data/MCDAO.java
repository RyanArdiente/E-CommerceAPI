package data;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional
public class MCDAO 
{
	@PersistenceContext
	EntityManager em;

	
	
public productsEntitie getTestProduct () {
	
	int id = 65;
	productsEntitie testProduct = (productsEntitie)em.createNamedQuery("getProductsById").setParameter("id", id).getSingleResult();
	return testProduct;
}

public List<productsEntitie> getAllProducts()
{
	List<productsEntitie> products = (List<productsEntitie>)em.createNamedQuery("getAllProducts").getResultList();
	return products;
}

public List<productsEntitie> getCategories(String cat) 
{
	System.out.println("in dao get categories "+cat);
	List<productsEntitie> products = (List<productsEntitie>)em.createNamedQuery("getProductsByCategory").setParameter("cat", cat).getResultList();
	return products;
}

public void addToCart(String json){
	int productID = Integer.parseInt(json.split(":")[1].split(",")[0].replaceAll("\"", ""));
	int userID = Integer.parseInt(json.split(":")[2].replace("}", ""));
	userEntitie ue = em.find(userEntitie.class, userID);
	productsEntitie pe = em.find(productsEntitie.class, productID);
	
//	ShoppingCartItemsEntitie scie = new ShoppingCartItemsEntitie();
//	scie.setProducts_id(pe);
	
	if (ue.getCart() != null){
		System.out.println("in if of addToCart");
//		ue.getCart().addToProductsList(pe);
		//scie.setShoppingCart_id(ue.getCart());
	
	}
	else {
		System.out.println("in else of addToCart");
		shoppingCartEntitie mycart = new shoppingCartEntitie();
	//	scie.setShoppingCart_id(mycart);
		mycart.setUsers_id(ue);
		mycart.setType("shopping cart");
//		mycart.addToProductsList(pe);
//		ue.setCart(mycart);
		
	}
	//em.persist(scie);
	em.merge(ue);
	em.persist(ue);
//	System.out.println(ue.getCart().getProductsList());
//	System.out.println(ue.getCart().getProductsList().size());
}
	
//	public productsEntitie getProductsbyID (String json){
//		
//		
//		
//		
//		ObjectMapper mapper = new ObjectMapper();
//		productsEntitie product;
//		try
//		{
//			prod = mapper.readValue(json, userEntitie.class);
//			String email = user.getEmail();
//			String password = user.getPassword();
//			
//			userEntitie checkUser = getUserByEmail(email);
//			if (checkUser.getEmail().equals(email) && checkUser.getPassword().equals(password))
//			{
//				return user;
//			}
//		} 
//		catch (IOException e)
//		{
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return null;
//		
//		
//		
//		
//		
//		
//		System.out.println("inside DAO Id");
//		productsEntitie product  = (productsEntitie)em.createNamedQuery("getProductsById").setParameter("id", id).getSingleResult();
//		return product;
//	}

}