package data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="shoppingcart")
public class shoppingCartEntitie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne(optional = false)
	@JoinColumn(name = "user_id", nullable = false)
	private userEntitie user_id;
	private int product_id;
	private int quantity;
	private String type;
	
	public shoppingCartEntitie(){}
	
	public shoppingCartEntitie(int id, userEntitie users_id, int products_id, int quantity, String type) {
		super();
		this.id = id;
		this.user_id = users_id;
		this.product_id = products_id;
		this.quantity = quantity;
		this.type = type;
	}
	
	public userEntitie getUsers_id() {
		return user_id;
	}
	
	public void setUsers_id(userEntitie users_id) {
		this.user_id = users_id;
	}
	public int getProducts_id() {
		return product_id;
	}
	public void setProducts_id(int products_id) {
		this.product_id = products_id;
	}
	public int getquantity() {
		return quantity;
	}
	public void setquantity(int quantity) {
		this.quantity = quantity;
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
	
	

}
