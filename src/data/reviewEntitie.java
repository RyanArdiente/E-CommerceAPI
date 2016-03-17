package data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "reviews")
public class reviewEntitie
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int products_id;
	private int userID;
	private String review;
	private String rating;
	private String date;
	
	public reviewEntitie()
	{
		super();
	}

	public reviewEntitie(int id, int products_id, int userID, String review, String rating, String date)
	{
		super();
		this.id = id;
		this.products_id = products_id;
		this.userID = userID;
		this.review = review;
		this.rating = rating;
		this.date = date;
	}

	/**
	 * @return the id
	 */
	public int getId()
	{
		return id;
	}

	/**
	 * @return the products_id
	 */
	public int getProducts_id()
	{
		return products_id;
	}

	/**
	 * @return the userID
	 */
	public int getUserID()
	{
		return userID;
	}

	/**
	 * @return the review
	 */
	public String getReview()
	{
		return review;
	}

	/**
	 * @return the rating
	 */
	public String getRating()
	{
		return rating;
	}

	/**
	 * @return the date
	 */
	public String getDate()
	{
		return date;
	}

	/**
	 * @param products_id the products_id to set
	 */
	public void setProducts_id(int products_id)
	{
		this.products_id = products_id;
	}

	/**
	 * @param userID the userID to set
	 */
	public void setUserID(int userID)
	{
		this.userID = userID;
	}

	/**
	 * @param review the review to set
	 */
	public void setReview(String review)
	{
		this.review = review;
	}

	/**
	 * @param rating the rating to set
	 */
	public void setRating(String rating)
	{
		this.rating = rating;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(String date)
	{
		this.date = date;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString()
	{
		return "reviewEntitie [id=" + id + ", products_id=" + products_id + ", userID=" + userID + ", review=" + review
				+ ", rating=" + rating + ", date=" + date + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
