package com.chunyu.front.model;

public class ClassifyEntity {
	private int id;
	private String name;
	private int parentId;
	private int isCount;
	private int onlyReservation;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public int getIsCount() {
		return isCount;
	}
	public void setIsCount(int isCount) {
		this.isCount = isCount;
	}
	public int getOnlyReservation() {
		return onlyReservation;
	}
	public void setOnlyReservation(int onlyReservation) {
		this.onlyReservation = onlyReservation;
	}
	
}
