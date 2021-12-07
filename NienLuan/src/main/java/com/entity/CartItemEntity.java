package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="giohang")
public class CartItemEntity {


public PhoneEntity getRefPhone() {
		return refPhone;
	}

	public void setRefPhone(PhoneEntity refPhone) {
		this.refPhone = refPhone;
	}

	public UserEntity getRefUser() {
		return refUser;
	}

	public void setRefUser(UserEntity refUser) {
		this.refUser = refUser;
	}

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;

@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn(name="idSanpham")
private PhoneEntity refPhone;

@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn(name="idKhachhang")
private UserEntity refUser;

@Column(name="soluong")
private int soluong;


public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}


public int getSoluong() {
	return soluong;
}

public void setSoluong(int soluong) {
	this.soluong = soluong;
}







}
