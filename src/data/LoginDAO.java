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

	public List<userEntitie> getAllUsers()
	{
		System.out.println("inside DAO getAllUsers");
		List<userEntitie> userList = (List<userEntitie>) em.createNamedQuery("getALL").getResultList();
		return userList;
	}

	public userEntitie getUserById(int id)
	{
		System.out.println("inside DAO Id");
		try
		{
			userEntitie user = (userEntitie) em.createNamedQuery("getUserById").setParameter("id", id)
					.getSingleResult();
			return user;
		} catch (Exception e)
		{
			return null;
		}
	}

	public userEntitie getUserByEmail(String email)
	{
		System.out.println("inside DAO Email");
		try
		{
			userEntitie user = (userEntitie) em.createNamedQuery("getUserByEmail").setParameter("email", email)
					.getSingleResult();
			return user;
		} catch (Exception e)
		{
			return null;
		}

	}

	public userEntitie getUserByPassword(String password)
	{
		System.out.println("inside DAO Password");
		userEntitie user = (userEntitie) em.createNamedQuery("getUserByPassword").setParameter("password", password)
				.getSingleResult();
		return user;
	}

	public userEntitie createUser(userEntitie newUser)
	{
		System.out.println("in create user DAO");
		userEntitie checkUser;
		try
		{
			checkUser = (userEntitie) em.createNamedQuery("getUserByEmail").setParameter("email", newUser.getEmail())
					.getSingleResult();
			if (!checkUser.getEmail().toLowerCase().equals(newUser.getEmail().toLowerCase()))
			{
				System.out.println("inside if statemet in createUSer method");
				// shoppingCartEntitie cart = new shoppingCartEntitie();
				// cart.setUsers_id(newUser);
				// cart.setType("shopping cart");
				// newUser.setCart(cart);
				em.persist(newUser);
				System.out.println("persisted User");
				return newUser;
			} else
			{
				newUser.setName("Username already exists");
				return newUser;
			}
		} catch (Exception e)
		{
			em.persist(newUser);
			System.out.println(e);
			System.out.println(newUser.getId());
			return newUser;
		}
		// if (!em.contains(newUser))
		// {
		// return false;
		// }
		// else
		// {
		// return true;
		// }
	}

	public userEntitie login(userEntitie json)
	{
		// ObjectMapper mapper = new ObjectMapper();
		// userEntitie user;
		try
		{
			// json = mapper.readValue(json, userEntitie.class);
			String email = json.getEmail();
			String password = json.getPassword();

			userEntitie checkUser = getUserByEmail(email);
			if (checkUser == null)
			{
				userEntitie tempUser = new userEntitie();
				tempUser.setName("Username/password is incorrect");
				return tempUser;
			}
			if (validateEmail(checkUser, email) && validatePassword(checkUser, password))
			{

				return checkUser;
			} else if (validateEmail(checkUser, email))
			{
				userEntitie tempUser = new userEntitie();
				tempUser.setName("Invalid username");
				return tempUser;
			} else if (validatePassword(checkUser, password))
			{
				userEntitie tempUser = new userEntitie();
				tempUser.setName("Invalid password");
				return tempUser;
			} else
			{
				userEntitie tempUser = new userEntitie();
				tempUser.setName("Username/password is incorrect");
				return tempUser;
			}
		} catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			userEntitie tempUser = new userEntitie();
			tempUser.setName("Catch error");
			return tempUser;
		}
	}

	public userEntitie editUser(String user)
	{
		ObjectMapper om = new ObjectMapper();
		int userId = Integer.parseInt(user.split(":")[1].split(",")[0]);
		System.out.println(userId);
		userEntitie changes = null;
		userEntitie userDB = em.find(userEntitie.class, userId);
		try
		{
			System.out.println(user);
			changes = om.readValue(user, userEntitie.class);
			if (changes.getEmail() != null)
			{
				userDB.setEmail(changes.getEmail());
			}
			if (changes.getName() != null)
			{
				userDB.setName(changes.getName());
			}
			if (changes.getPassword() != null)
			{
				userDB.setPassword(changes.getPassword());
			}

		} catch (IOException e1)
		{
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		em.merge(userDB);
		return userDB;
	}

	public String deleteUser(userEntitie user)
	{

		userEntitie ue = em.find(userEntitie.class, user.getId());
		em.remove(ue);
		userEntitie check = em.find(userEntitie.class, user.getId());
		if (check == null)
		{
			return "delete account successful";
		} else
		{
			return "delete account failed";
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