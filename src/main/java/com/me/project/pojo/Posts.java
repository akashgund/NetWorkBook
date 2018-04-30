package com.me.project.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name="postsTable")
public class Posts {

	
	@Id
	@Column(name="postID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	

	
	@Column(name="caption")
	private String caption;
	
	@Column(name="location")
	private String location;
	
	@Column(name="upvotes")
	private int upvotes;
	
	@Column(name="downvotes")
	private int downvotes;
	
	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "postingUser"))
	@Column(name = "postingUser", nullable = false)
		private int  postingUserId;
	
	@ManyToOne
	@PrimaryKeyJoinColumn
	private User postingUser;
	//arraylist of comments
	
	@Column(name="time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date timestamp;
	
	@OneToOne(mappedBy = "posts" ,cascade=CascadeType.ALL)
	private Comments comments;

	
	@OneToOne(mappedBy="posts" ,cascade =CascadeType.ALL)
	Likers likers ;
	
	@OneToOne(mappedBy="posts" ,cascade =CascadeType.ALL)
	Dislikers dislikers;
	
	

	public Likers getLikers() {
		return likers;
	}

	public void setLikers(Likers likers) {
		this.likers = likers;
	}

	public int getId() {
		return id;
	}
	
	@Column(name="userName")
	private String userName;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getUpvotes() {
		return upvotes;
	}

	public void setUpvotes(int upvotes) {
		this.upvotes = upvotes;
	}

	public int getDownvotes() {
		return downvotes;
	}

	public void setDownvotes(int downvotes) {
		this.downvotes = downvotes;
	}

	public int getPostingUserId() {
		return postingUserId;
	}

	public void setPostingUserId(int postingUserId) {
		this.postingUserId = postingUserId;
	}

	public User getPostingUser() {
		return postingUser;
	}

	public void setPostingUser(User postingUser) {
		this.postingUser = postingUser;
	}

	public Comments getComments() {
		return comments;
	}

	public void setComments(Comments comments) {
		this.comments = comments;
	}
	
}
