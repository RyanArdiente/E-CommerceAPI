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
		userEntitie checkUser;
		try
		{
			checkUser = (userEntitie)em.createNamedQuery("getUserByEmail").setParameter("email", newUser.getEmail()).getSingleResult();
			if (!checkUser.getEmail().toLowerCase().equals(newUser.getEmail().toLowerCase()))
			{
				em.persist(newUser);
				return newUser;
			}
			else
			{
				newUser.setName("Username already exists");
				return newUser;
			}			
		}
		catch (Exception e)
		{
			em.persist(newUser);
			System.out.println(e);
			return newUser;
		}
//		if (!em.contains(newUser))
//		{
//			return false;
//		}
//		else
//		{
//			return true;
//		}
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
			if (validateEmail(checkUser, email) && validatePassword(checkUser, password))
			{
				return user;
			}
			else if (validateEmail(checkUser, email))
			{
				userEntitie tempUser = new userEntitie();
				tempUser.setName("Invalid username");
				return tempUser;				
			}
			else if (validatePassword(checkUser, password))
			{
				userEntitie tempUser = new userEntitie();
				tempUser.setName("Invalid password");
				return tempUser;				
			}
			else
			{
				userEntitie tempUser = new userEntitie();
				tempUser.setName("Username/password is incorrect");
				return tempUser;				
			}
		}
		catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			userEntitie tempUser = new userEntitie();
			tempUser.setName("Catch error");
			return tempUser;
		}
	}
	public boolean validateEmail(userEntitie checkUser, String email)
	{
		
		if (checkUser.getEmail().equals(email))
			return true;
		else
			return false;
	}
	public boolean validatePassword(userEntitie checkUser, String password)
	{
		if (checkUser.getPassword().equals(password))
			return true;
		else
			return false;
	}
}