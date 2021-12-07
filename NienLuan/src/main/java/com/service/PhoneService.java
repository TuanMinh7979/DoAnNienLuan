package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.entity.PhoneEntity;
import com.repository.iPhoneRepo;
@Service
public class PhoneService {

	@Autowired
	private iPhoneRepo phoneRepo;
	public List<PhoneEntity> findAll(){
		return phoneRepo.findAll();
	}
	public List<PhoneEntity> findAll(Pageable pageable) {
		
		return phoneRepo.findAll(pageable).getContent();
	}

	

	public int getTotalItem() {
		return (int) phoneRepo.count();
	}
	public PhoneEntity findById(int id) {
		return phoneRepo.findById(id);
	}
	public void deleteById(int id) {
		 phoneRepo.deleteById(id);
		
	}
	public PhoneEntity save(PhoneEntity phone) {
		// TODO Auto-generated method stub
		return phoneRepo.save(phone);
	}
	


	
}
	