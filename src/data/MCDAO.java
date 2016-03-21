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