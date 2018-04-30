 package com.me.project.pojo;

import java.util.ArrayList;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name="CommentsTable")
public class Comments {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="commentId",unique = true, nullable = false)
	private int commentId;

	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "posts"))
	@Column(name = "postId", nullable = false)
		private int  postId;
	
	@ManyToOne
	@PrimaryKeyJoinColumn
	private Posts posts;
	
	@Column(name="commmentString")
	private String commentString;
	
	@Column(name="timeStamp")
	private Date timeStamp;
	
	@Column(name="likes")
	private int likes;
	
	//ArrayList<User> likers;
	private int dislikes;
	
	//ArrayList<User>dislikers;
		
	
}
