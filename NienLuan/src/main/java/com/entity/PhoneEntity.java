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
@Table(name = "sanpham")
public class PhoneEntity {

	public BrandEntity getRefBrand() {
		return refBrand;
	}
	public void setRefBrand(BrandEntity refBrand) {
		this.refBrand = refBrand;
	}
	public int getKho() {
		return kho;
	}
	public void setKho(int kho) {
		this.kho = kho;
	}
	public List<CartItemEntity> getHaveCartitem() {
		return haveCartitem;
	}
	public void setHaveCartitem(List<CartItemEntity> haveCartitem) {
		this.haveCartitem = haveCartitem;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@OneToMany(mappedBy="refPhone") 
	@JsonIgnore
    private List<CartItemEntity> haveCartitem= new ArrayList<>();
	
	@OneToMany(mappedBy="refPhone") 
	@JsonIgnore
	private List<OrderDetailEntity> haveOrderDetail= new ArrayList<>();
	
	@OneToMany(mappedBy="refPhone") 
	@JsonIgnore
	private List<CommentEntity> haveComment= new ArrayList<>();
	
	@OneToMany(mappedBy="refPhone") 
	@JsonIgnore
	private List<ReviewEntity> haveReview= new ArrayList<>();


	
	@Column(name="tensanpham")
	private String tensanpham;
	
	@Column(name="gia")
	private int gia;
	
	@Column(name="mau")
	private String mau;
	
	@Column(name="manhinh")
	private float manhinh;
	
	@Column(name="bonho")
	private int bonho;
	
	@Column(name="hedieuhanh")
	private String hedieuhanh;
	
	@Column(name="namsx")
	private int namsx;
	
	@Column(name="camera")
	private String camera;
	
	@Column(name="ketnoi")
	private String ketnoi;
	
	@Column(name="sim")
	private String sim;
	
	@Column(name="pin")
	private int pin;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="idThuonghieu")
	private BrandEntity refBrand;
	
	@Column(name="rating")
	private int rating;
	
	@Column(name="anh")
	private String anh;
	
	@Column(name="kho")
	private int kho;
	
	
	public String getTensanpham() {
		return tensanpham;
	}
	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public String getMau() {
		return mau;
	}
	public void setMau(String mau) {
		this.mau = mau;
	}
	public float getManhinh() {
		return manhinh;
	}
	public void setManhinh(float manhinh) {
		this.manhinh = manhinh;
	}
	public int getBonho() {
		return bonho;
	}
	public void setBonho(int bonho) {
		this.bonho = bonho;
	}
	public String getHedieuhanh() {
		return hedieuhanh;
	}
	public void setHedieuhanh(String hedieuhanh) {
		this.hedieuhanh = hedieuhanh;
	}
	public int getNamsx() {
		return namsx;
	}
	public void setNamsx(int namsx) {
		this.namsx = namsx;
	}
	public String getCamera() {
		return camera;
	}
	public void setCamera(String camera) {
		this.camera = camera;
	}
	public String getKetnoi() {
		return ketnoi;
	}
	public void setKetnoi(String ketnoi) {
		this.ketnoi = ketnoi;
	}
	public String getSim() {
		return sim;
	}
	public void setSim(String sim) {
		this.sim = sim;
	}
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}

	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	
	
	
	


}
