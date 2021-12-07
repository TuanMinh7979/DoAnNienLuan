package com.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "nguoidung")
public class UserEntity {


	public List<CartItemEntity> getHaveCartitem() {
		return haveCartitem;
	}

	public void setHaveCartitem(List<CartItemEntity> haveCartitem) {
		this.haveCartitem = haveCartitem;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	
	
	@OneToMany(mappedBy="refUser") 
	@JsonIgnore
    private List<CartItemEntity> haveCartitem=  new ArrayList<>();
	
	@OneToMany(mappedBy="refUser") 
	@JsonIgnore
	private List<OrderEntity> haveOrder=  new ArrayList<>();
	
	@OneToMany(mappedBy="refUser") 
	@JsonIgnore
	private List<CommentEntity> haveComment= new ArrayList<>();
	
	@OneToMany(mappedBy="refUser") 
	@JsonIgnore
	private List<ReviewEntity> haveReview= new ArrayList<>();

	@Column(name = "tentaikhoan")
	private String tentaikhoan;

	@Column(name = "matkhau")
	private String matkhau;

	@Column(name = "sdt")
	private String sdt;

	@Column(name = "diachi")
	private String diachi;

	@Column(name = "role")
	private int role;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTentaikhoan() {
		return tentaikhoan;
	}

	public void setTentaikhoan(String tentaikhoan) {
		this.tentaikhoan = tentaikhoan;
	}

	public String getMatkhau() {
		return matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	

}
