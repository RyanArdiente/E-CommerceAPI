package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class userEntitie
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String email;
	private String password;
	@OneToMany(mappedBy = "users_id", cascade = CascadeType.ALL)
	private List<addressEntitie> address = new ArrayList<>();
	@OneToMany(mappedBy = "users_id", cascade = CascadeType.ALL)
	private List<shoppingCartEntitie> cart = new ArrayList<>();
	
	public userEntitie(){}

	public userEntitie(int id, String name, String email, String password)
	{
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
	}

	/**
	 * @return the id
	 */
	public int getId()
	{
		return id;
	}

	/**
	 * @return the name
	 */
	public String getName()
	{
		return name;
	}

	/**
	 * @return the email
	 */
	public String getEmail()
	{
		return email;
	}

	/**
	 * @return the password
	 */
	public String getPassword()
	{
		return password;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name)
	{
		this.name = name;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email)
	{
		this.email = email;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password)
	{
		this.password = password;
	}

	public List<addressEntitie> getAddress() {
		return address;
	}

	public void setAddress(List<addressEntitie> address) {
		this.address = address;
	}
	public List<shoppingCartEntitie> getCart() {
		return cart;
	}
	
	public void setCart(List<shoppingCartEntitie> cart) {
		this.cart = cart;
	}

	public void addCart(shoppingCartEntitie cart)
    {
        if (!getCart().contains(cart))
        {
            getCart().add(cart);
        }
    }
    public void removeCart(shoppingCartEntitie cart)
    {
        if (getCart().contains(cart))
        {
            getCart().remove(cart);

        }
    }
    public void addAddress(addressEntitie address)
    {
    	if (!getAddress().contains(address))
    	{
    		getAddress().add(address);
    	}
    }
    public void removeAddress(addressEntitie address)
    {
    	if (getAddress().contains(address))
    	{
    		getAddress().remove(address);
    		
    	}
    }
	

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString()
	{
		return "userEntitie [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + "]";
	}
	
	
	

	
}
