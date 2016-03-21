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
	
}