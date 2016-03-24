package data;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;



@Entity
@Table(name = "ShoppingcartItems")
@NamedQueries({ @NamedQuery(name = "getALLShoppingCartItems", query = "select u from userEntitie u"),
	@NamedQuery(name = "getSCitemsbyID", query = "select u from ShoppingCartItemsEntitie u where u.id = :id") })
public class ShoppingCartItemsEntitie {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id; 
	
	@JsonBackReference(value ="shopingCartItemsToShoppingCart")
	@ManyToOne(cascade =  CascadeType.ALL)
	@JoinColumn(name = "shoppingCart_id")
	private shoppingCartEntitie shoppingCart_id;
	
	@JsonBackReference(value ="shopingCartItemsToProduct")
	@ManyToOne(cascade =  CascadeType.ALL)
	@JoinColumn(name = "products_id")
	private productsEntitie products_id;
	private int quantity;
	
	public ShoppingCartItemsEntitie(){}

	public ShoppingCartItemsEntitie(shoppingCartEntitie shoppingCart_id, productsEntitie products_id, int quantity) {
		super();
		this.shoppingCart_id = shoppingCart_id;
		this.products_id = products_id;
		this.quantity = quantity;
	}

	public shoppingCartEntitie getShoppingCart_id() {
		return shoppingCart_id;
	}
	
	public void setShoppingCart_id(shoppingCartEntitie shoppingCart_id) {
		this.shoppingCart_id = shoppingCart_id;
	}
	
	public productsEntitie getProducts_id() {
		return products_id;
	}

	public void setProducts_id(productsEntitie products_id) {
		this.products_id = products_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getId()
	{
		return id;
	}

	@Override
	public String toString()
	{
		return "ShoppingCartItemsEntitie [id=" + id + ", shoppingCart_id=" + shoppingCart_id + ", products_id="
				+ products_id + ", quantity=" + quantity + "]";
	}


	
	
}
