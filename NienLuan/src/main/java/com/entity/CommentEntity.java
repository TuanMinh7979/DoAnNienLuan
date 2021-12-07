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
@Table(name = "binhluan")
public class CommentEntity {
	public String getTenkhachhang() {
		return tenkhachhang;
	}

	public void setTenkhachhang(String tenkhachhang) {
		this.tenkhachhang = tenkhachhang;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNoidung() {
		return noidung;
	}

	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}

	public UserEntity getRefUser() {
		return refUser;
	}

	public void setRefUser(UserEntity refUser) {
		this.refUser = refUser;
	}

	public PhoneEntity getRefPhone() {
		return refPhone;
	}

	public void setRefPhone(PhoneEntity refPhone) {
		this.refPhone = refPhone;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "noidung")
	private String noidung;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idKhachhang")
	private UserEntity refUser;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idSanpham")
	private PhoneEntity refPhone;
	
	@Transient
	private String tenkhachhang;
	

}
