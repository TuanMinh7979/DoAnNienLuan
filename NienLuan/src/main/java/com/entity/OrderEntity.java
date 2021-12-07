package com.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name="donhang")
public class OrderEntity {
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTinhtrang() {
		return tinhtrang;
	}


	public void setTinhtrang(String tinhtrang) {
		this.tinhtrang = tinhtrang;
	}


	public String getDiachinhanhang() {
		return diachinhanhang;
	}


	public void setDiachinhanhang(String diachinhanhang) {
		this.diachinhanhang = diachinhanhang;
	}


	public int getThanhtien() {
		return thanhtien;
	}


	public void setThanhtien(int thanhtien) {
		this.thanhtien = thanhtien;
	}


	public List<OrderDetailEntity> getHaveOrderDetail() {
		return haveOrderDetail;
	}


	public void setHaveOrderDetail(List<OrderDetailEntity> haveOrderDetail) {
		this.haveOrderDetail = haveOrderDetail;
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
	
	@Column(name="tinhtrang")
	private String tinhtrang;
	
	@Column(name="diachinhanhang")
	private String diachinhanhang;
	
	@Column(name="thanhtien")
	private int thanhtien;
	
	@OneToMany(mappedBy="refOrder") 
	@JsonIgnore
    private List<OrderDetailEntity> haveOrderDetail=  new ArrayList<>();

	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="idKhachhang")
	private UserEntity refUser;
	
}
