package com.chunyu.front.model;

import java.util.Date;
/**
 * 
 * @author 评论表
 *
 */
public class CommentsEntity {
private int id;//自增id
private int goodId;//商品id
private int userId;//用户id
private String username;//用户名称
private String content;//评论内容
private String commentTime;//评论时间
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getGoodId() {
	return goodId;
}
public void setGoodId(int goodId) {
	this.goodId = goodId;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getCommentTime() {
	return commentTime;
}
public void setCommentTime(String commentTime) {
	this.commentTime = commentTime;
}


}
