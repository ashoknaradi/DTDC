package Pojos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "dtdc_user")
public class User {

	@Column(name = "userName")
	private String userName;
	
	@Column(name = "userMobile")
	private String userMobile;
	
	@Id
	@Column(name = "userEmail")
	private String userEmail;
	
	@Column(name = "userCity")
	private String userCity;
	
	@Column(name = "userPassword")
	private String userPassword;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserCity() {
		return userCity;
	}
	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	@Override
	public String toString() {
		return "User [userName=" + userName + ", userMobile=" + userMobile + ", userEmail=" + userEmail + ", userCity="
				+ userCity + ", userPassword=" + userPassword + "]";
	}
}
