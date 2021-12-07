package com.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.BrandEntity;
import com.repository.iBrandRepo;
@Service
public class BrandService{
	@Autowired
	private iBrandRepo brandRepo;
	
	public List<BrandEntity> findAll(){
		return brandRepo.findAll();
	}

	public BrandEntity findByid(int id) {
		// TODO Auto-generated method stub
		return brandRepo.findById( id);
	}



	
	
}
