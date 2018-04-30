package com.me.project.pojo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;



@Entity
@Table(name="EventTable")
public class Event {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="eventId")
	private int eventId;

	@Column(name="upvotes")
	private int upvotes;
	
	@Column(name="caption")
	private String caption;
	
	@Column(name="visitors")
	private int visitors;
	
	
	
	@ManyToMany
    @JoinTable (
       name="User_Event_vistorTable",
       joinColumns = {@JoinColumn(name="eventId", nullable = false, updatable = false)},
       inverseJoinColumns = {@JoinColumn(name="userId" )}
    )
	private List<User> visitor;
	
	
	private ArrayList<User> likers;

	
	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "eventOwner"))
	@Column(name = "senderID", nullable = false)
		private int ownerUserId;
	
	@Column(name="ownerName")
	private String ownerName;
	
	
	@ManyToOne
	@PrimaryKeyJoinColumn
	private User eventOwner;
	
	
	@Column(name="location")
	private String location;
	
	
	
	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getOwnerName() {
		return ownerName;
	}


	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}


	public int getOwnerUserId() {
		return ownerUserId;
	}


	public void setOwnerUserId(int ownerUserId) {
		this.ownerUserId = ownerUserId;
	}


	public User getEventOwner() {
		return eventOwner;
	}


	public void setEventOwner(User eventOwner) {
		this.eventOwner = eventOwner;
	}


	public String getCaption() {
		return caption;
	}


	public void setCaption(String caption) {
		this.caption = caption;
	}


	public int getEventId() {
		return eventId;
	}


	public void setEventId(int eventId) {
		this.eventId = eventId;
	}


	public int getUpvotes() {
		return upvotes;
	}


	public void setUpvotes(int upvotes) {
		this.upvotes = upvotes;
	}


	public int getVisitors() {
		return visitors;
	}


	public void setVisitors(int visitors) {
		this.visitors = visitors;
	}


	public List<User> getVisitor() {
		return visitor;
	}


	public void setVisitor(ArrayList<User> visitor) {
		this.visitor = visitor;
	}
	
	
	
	
	
	

}
