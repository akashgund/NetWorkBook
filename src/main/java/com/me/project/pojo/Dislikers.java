package com.me.project.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;


@Entity
@Table(name="DislikersTable")
public class Dislikers {
	
	@Id
	@Column(name="DislikeId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int DislikeId;

	
	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "posts"))
	@Column(name = "postId", nullable = false)
		private int postId;

	@Column(name="userName")
	private String userName;
	
	
	@ManyToOne
	@PrimaryKeyJoinColumn
	private Posts posts;


	public int getPostId() {
		return postId;
	}


	public void setPostId(int postId) {
		this.postId = postId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public Posts getPosts() {
		return posts;
	}


	public void setPosts(Posts posts) {
		this.posts = posts;
	}
	
	
}
