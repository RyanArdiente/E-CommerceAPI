package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "products")
@NamedQueries({ @NamedQuery(name = "getALLProducts", query = "select u from productsEntitie u"),
		@NamedQuery(name = "getProductsById", query = "select u from productsEntitie u where u.id = :id"),
		@NamedQuery(name = "getProductsByCategory", query = "select u from productsEntitie u where u.category = :category"),
		@NamedQuery(name = "getProductsByDesription", query = "select u from productsEntitie u where u.description = :description") })

public class productsEntitie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String category;
	private String price;
	private String description;
	private String brand;
	private String name;
	@OneToMany(mappedBy = "product_id", cascade = CascadeType.ALL)
	private List<reviewEntitie> review = new ArrayList<>();
	@ManyToMany
	@JoinTable(name = "shoppingCartItems", joinColumns = @JoinColumn(name = "products_id") , inverseJoinColumns = @JoinColumn(name = "shoppingCart_id") )
	private List<shoppingCartEntitie> cartList = new ArrayList<>();

	public productsEntitie() {
		super();
	}

	public productsEntitie(int id, String category, String price, String description, String brand, String name) {
		super();
		this.id = id;
		this.category = category;
		this.price = price;
		this.description = description;
		this.brand = brand;
		this.name = name;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @return the category
	 */
	public String getcategory() {
		return category;
	}

	/**
	 * @return the price
	 */
	public String getPrice() {
		return price;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @return the brand
	 */
	public String getBrand() {
		return brand;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @param category
	 *            the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}

	/**
	 * @param price
	 *            the price to set
	 */
	public void setPrice(String price) {
		this.price = price;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @param brand
	 *            the brand to set
	 */
	public void setBrand(String brand) {
		this.brand = brand;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	public List<reviewEntitie> getReview() {
		return review;
	}

	public void setReview(List<reviewEntitie> review) {
		this.review = review;
	}

	public void addReview(reviewEntitie review) {
		if (!getReview().contains(review)) {
			getReview().add(review);
		}
	}

	public void removeAddress(reviewEntitie review) {
		if (getReview().contains(review)) {
			getReview().remove(review);

		}
	}

	public List<shoppingCartEntitie> getCartList() {
		return cartList;
	}

	public void setCartList(List<shoppingCartEntitie> cartList) {
		this.cartList = cartList;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "productsEntitie [id=" + id + ", category=" + category + ", price=" + price + ", description="
				+ description + ", brand=" + brand + ", name=" + name + "]";
	}

}
