package data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="address")
public class addressEntitie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne(optional = false)
	@JoinColumn(name = "users_id", nullable = false)
	private userEntitie users_id;
	private String address;
	private String type;
	
	public addressEntitie(){}
	
	public addressEntitie(int id, userEntitie users_id, String address, String type) {
		super();
		this.id = id;
		this.users_id = users_id;
		this.address = address;
		this.type = type;
	}
	public userEntitie getUsers_id() {
		return users_id;
	}
	public void setUsers_id( userEntitie users_id) {
		this.users_id = users_id;
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
