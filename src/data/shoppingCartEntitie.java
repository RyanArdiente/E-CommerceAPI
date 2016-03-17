package data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="shoppingCart")
public class shoppingCartEntitie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne(optional = false)
	@JoinColumn(name = "users_id", nullable = false)
	private userEntitie users_id;
	private int products_id;
	private int rating;
	private String date;
	
	public shoppingCartEntitie(){}
	
	public shoppingCartEntitie(int id, userEntitie users_id, int products_id, int rating, String date) {
		super();
		this.id = id;
		this.users_id = users_id;
		this.products_id = products_id;
		this.rating = rating;
		this.date = date;
	}
	
	public userEntitie getUsers_id() {
		return users_id;
	}
	
	public void setUsers_id(userEntitie users_id) {
		this.users_id = users_id;
	}
	public int getProducts_id() {
		return products_id;
	}
	public void setProducts_id(int products_id) {
		this.products_id = products_id;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getId() {
		return id;
	}
	
	

}
