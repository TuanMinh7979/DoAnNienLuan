package com.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.entity.PhoneEntity;
import com.service.BrandService;
import com.service.PhoneService;

@RestController
public class PhoneApi {
 @Autowired
 private PhoneService phoneService;

 @Autowired
 private BrandService brandService;
 
    @PostMapping(value = "/api/phone")
	public int create(@RequestBody Map<String, String> inpinfo) {
    	PhoneEntity phone = new PhoneEntity();
    	phone.setTensanpham(inpinfo.get("tensanpham"));
    	phone.setRefBrand(brandService.findByid(Integer.valueOf(inpinfo.get("idThuonghieu"))));
    	phone.setMau(inpinfo.get("mau"));
    	phone.setManhinh(Integer.valueOf(inpinfo.get("manhinh")));
    	phone.setCamera(inpinfo.get("camera"));
    	phone.setBonho(Integer.valueOf(inpinfo.get("bonho")));
    	phone.setHedieuhanh(inpinfo.get("hedieuhanh"));
    	phone.setKetnoi(inpinfo.get("ketnoi"));
    	phone.setSim(inpinfo.get("sim"));
    	phone.setPin(Integer.valueOf(inpinfo.get("pin")));
    	phone.setGia(Integer.valueOf(inpinfo.get("gia")));
    	phone.setKho(Integer.valueOf(inpinfo.get("kho")));
    	PhoneEntity savedPhone= phoneService.save(phone);
    	
       return savedPhone.getId();   	
 }
    
    @PutMapping(value="/api/phone")
    public int update(@RequestBody Map<String, String> inpinfo) {
    	PhoneEntity phone= phoneService.findById(Integer.valueOf(inpinfo.get("id")));
    	
    	phone.setTensanpham(inpinfo.get("tensanpham"));
    	phone.setRefBrand(brandService.findByid(Integer.valueOf(inpinfo.get("idThuonghieu"))));
    	phone.setMau(inpinfo.get("mau"));
    	phone.setManhinh(Integer.valueOf(inpinfo.get("manhinh")));
    	phone.setCamera(inpinfo.get("camera"));
    	phone.setBonho(Integer.valueOf(inpinfo.get("bonho")));
    	phone.setHedieuhanh(inpinfo.get("hedieuhanh"));
    	phone.setKetnoi(inpinfo.get("ketnoi"));
    	phone.setSim(inpinfo.get("sim"));
    	phone.setPin(Integer.valueOf(inpinfo.get("pin")));
    	phone.setGia(Integer.valueOf(inpinfo.get("gia")));
    	phone.setKho(Integer.valueOf(inpinfo.get("kho")));
    	PhoneEntity savedPhone= phoneService.save(phone);
    	
       return savedPhone.getId();   	
    	
    	
    }
 
	
	@DeleteMapping(value="/api/phone")
	public void delete(@RequestBody int id) {
		phoneService.deleteById(id);
		
}
}