package data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="shoppingCart")
public class shoppingCartEntitie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int userID;
	private int products_id;
	private int rating;
	private String date;
	
	public shoppingCartEntitie(){}
	
	public shoppingCartEntitie(int id, int userID, int products_id, int rating, String date) {
		super();
		this.id = id;
		this.userID = userID;
		this.products_id = products_id;
		this.rating = rating;
		this.date = date;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
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
