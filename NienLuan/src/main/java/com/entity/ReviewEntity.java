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
import javax.persistence.Transient;

@Entity
@Table(name="danhgia")
public class ReviewEntity {
	public int getIdphone() {
		return idphone;
	}

	public void setIdphone(int idphone) {
		this.idphone = idphone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
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
	
	@Column(name="rate")
	private int rate;
	
	@Transient
	private int idphone;
	
	
	

}
