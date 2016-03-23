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

	
	
public productsEntitie getSingleProduct (int id) {
	
	productsEntitie product = (productsEntitie)em.createNamedQuery("getProductsById").setParameter("id", id).getSingleResult();
	return product;
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
	userEntitie user = em.find(userEntitie.class, userID);
	productsEntitie product = em.find(productsEntitie.class, productID);
	
	ShoppingCartItemsEntitie scie = new ShoppingCartItemsEntitie();
	scie.setProducts_id(product);
	
	if (user.getCart() != null){
		System.out.println("my cart exist, so adding product to existing cart");
//		user.getCart().addToProductsList(product);
	scie.setShoppingCart_id(user.getCart());
		
	}
	else {
		System.out.println("no cart found, creating new cart and adding product");
		shoppingCartEntitie mycart = new shoppingCartEntitie();
		scie.setShoppingCart_id(mycart);
		mycart.setUsers_id(user);
		mycart.setType("shopping cart");
//		mycart.addToProductsList(product);
		user.setCart(mycart);	
	}
	
	em.merge(user);
	em.merge(product);
	em.persist(scie);
//	System.out.println(user.getCart().getProductsList());
//	System.out.println(user.getCart().getProductsList().size());

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