package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional
public class MCDAO {
	@PersistenceContext
	EntityManager em;
	

	public List<userEntitie> getAllUsers(){
		System.out.println("inside DAO getAllUsers");
		List<userEntitie> userList = (List<userEntitie>)em.createNamedQuery("getALL").getResultList();
		return userList;
	}
	
	public userEntitie getUserById(int id){
		System.out.println("inside DAO Id");
		userEntitie user = (userEntitie)em.createNamedQuery("getUserById").setParameter("id", id).getSingleResult();
		return user;
	}
	public userEntitie getUserByEmail(String email){
		System.out.println("inside DAO Email");
		userEntitie user = (userEntitie)em.createNamedQuery("getUserByEmail").setParameter("email", email).getSingleResult();
		return user;
	}
	public userEntitie getUserByPassword(String password){
		System.out.println("inside DAO Password");
		userEntitie user = (userEntitie)em.createNamedQuery("getUserByPassword").setParameter("password", password).getSingleResult();
		return user;
	}
	
}