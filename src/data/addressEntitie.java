package data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="address")

@NamedQueries({ @NamedQuery(name = "getALLAddress", query = "select u from addressEntitie u"),
	@NamedQuery(name = "getAddressbyID", query = "select u from productsEntitie u where u.id = :id"),
	@NamedQuery(name = "getAddressbyType", query = "select u from addressEntitie u where u.type = :email"),
	@NamedQuery(name = "getAddressbyUser_ID", query = "select u from productsEntitie u where u.description = :password"),
	@NamedQuery(name = "getAddressbyUser", query = "select u from addressEntitie u where u.user_id = :id") })
public class addressEntitie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
//	@JsonBackReference
	@OneToOne(optional = false)
	@JoinColumn(name = "user_id", nullable = false)
	private userEntitie user_id;
	private String address;
	private String type;
	
	public addressEntitie(){}
	
	public addressEntitie(int id, userEntitie user_id, String address, String type) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.address = address;
		this.type = type;
	}
	public userEntitie getuser_id() {
		return user_id;
	}
	public void setuser_id( userEntitie user_id) {
		this.user_id = user_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getId() {
		return id;
	}
	

}
