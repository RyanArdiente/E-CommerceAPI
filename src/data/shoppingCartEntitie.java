package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="shoppingcart")
public class shoppingCartEntitie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne(optional = false)
	@JoinColumn(name = "user_id", nullable = false)
	private userEntitie user_id;
	
	private String type; 
	
	
	@ManyToMany(mappedBy = "cartList", cascade =  CascadeType.ALL)
	private List<productsEntitie> productsList = new ArrayList<>();
	
	public shoppingCartEntitie(){}
	
	public shoppingCartEntitie(int id, userEntitie users_id, String type) {
		super();
		this.id = id;
		this.user_id = users_id;
		this.type = type;
	}
	
	
	
	public userEntitie getUsers_id() {
		return user_id;
	}
	
	public void setUsers_id(userEntitie users_id) {
		this.user_id = users_id;
	}
	public int getId() {
		return id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<productsEntitie> getProductsList() {
		return productsList;
	}
	


	public void addToProductsList(productsEntitie product){
		this.productsList.add(product);
	}
	
	public void setProductsList(List<productsEntitie> productsList) {
		this.productsList = productsList;
	}

//	@Override
//	public String toString() {
//		return "shoppingCartEntitie [id=" + id + ", user_id=" + user_id + ", type=" + type + ", productsList="
//				+ productsList + "]";
//	}
//	
	
	

}
