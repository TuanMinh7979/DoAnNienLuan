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
@Table(name="chitietdonhang")
public class OrderDetailEntity {


	public PhoneEntity getRefPhone() {
		return refPhone;
	}

	public void setRefPhone(PhoneEntity ref1Phone) {
		this.refPhone = ref1Phone;
	}

	public String getTensanphamcur() {
		return tensanphamcur;
	}

	public void setTensanphamcur(String tensanphamcur) {
		this.tensanphamcur = tensanphamcur;
	}



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

	public OrderEntity getRefOrder() {
		return refOrder;
	}

	public void setRefOrder(OrderEntity refOrder) {
		this.refOrder = refOrder;
	}



	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="soluong")
	private int soluong;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="idDonhang")
	private OrderEntity refOrder;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="idSanpham")
	private PhoneEntity refPhone;
	
	@Transient
	private String tensanphamcur;
	
	

	
	
}