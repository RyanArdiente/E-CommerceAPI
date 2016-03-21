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
public class LoginDAO 
{
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
	

	public userEntitie createUser(userEntitie newUser)
	{
		System.out.println("in create user DAO");
		em.persist(newUser);
//		if (!em.contains(newUser))
//		{
//			return false;
//		}
//		else
//		{
//			return true;
//		}
		return newUser;
	}
	public userEntitie login(String json)
	{
		ObjectMapper mapper = new ObjectMapper();
		userEntitie user;
		try
		{
			user = mapper.readValue(json, userEntitie.class);
			String email = user.getEmail();
			String password = user.getPassword();
			
			userEntitie checkUser = getUserByEmail(email);
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