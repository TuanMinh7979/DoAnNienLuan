package com.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name = "thuonghieu")
public class BrandEntity {
	

	@Id
	
	private int id;
	
	@Column(name="tenthuonghieu")
	private String tenthuonghieu;
	
	@OneToMany(mappedBy="refBrand") 
	@JsonIgnore
    private List<PhoneEntity> havePhone= new ArrayList<>();

	public String getTenthuonghieu() {
		return tenthuonghieu;
	}

	public void setTenthuonghieu(String tenthuonghieu) {
		this.tenthuonghieu = tenthuonghieu;
	}

}
