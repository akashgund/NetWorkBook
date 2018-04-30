package com.me.project.pojo;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;





@Entity
@Table(name="userTable")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="userId", unique = true, nullable = false)
	private int userId;
	
	@Column(name="userName")
	private String userName;
	
	@Column(name="userEmail",unique=true , nullable=false)
	private String userEmail;
	
	@Column(name="password")
	private String password;

	@Column(name="status")
	private int activationStatus;
	
	@Column(name="adminStatus")
	private int adminStatus;
	
	@OneToOne(mappedBy = "eventOwner", cascade = CascadeType.ALL)
	private Event event;
	
	@OneToOne(mappedBy = "sender", cascade = CascadeType.ALL)
	private Message senderID;
	
	@OneToOne(mappedBy = "receiver", cascade = CascadeType.ALL)
	private Message receiverID;
	
	@OneToOne(mappedBy = "postingUser" ,cascade=CascadeType.ALL)
	private Posts postingId;
	
	
	
	@ManyToMany(mappedBy="visitor")
	List<Event> events = new ArrayList<Event>();
	
	@Transient
	File file;
	
	
	@Column(name="profilePic")
	private String profilePic;
	
	
public String getProfilePic() {
		return profilePic;
	}



	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}



public int getAdminStatus() {
		return adminStatus;
	}



	public void setAdminStatus(int adminStatus) {
		this.adminStatus = adminStatus;
	}



public int getUserId() {
		return userId;
	}



	public String getUserEmail() {
	return userEmail;
}



public void setUserEmail(String userEmail) {
	this.userEmail = userEmail;
}



	public int getActivationStatus() {
	return activationStatus;
}


public void setActivationStatus(int activationStatus) {
	this.activationStatus = activationStatus;
}


	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

public User()
{
	
}



}
