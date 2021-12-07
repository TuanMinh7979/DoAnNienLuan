package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.UserEntity;
import com.repository.iUserRepo;

@Service
public class UserService {

	
	@Autowired
	private iUserRepo userRepo;
	
	public UserEntity findByTentaikhoan(String tentaikhoan) {
		return userRepo.findByTentaikhoan(tentaikhoan);
	}
	public UserEntity findById(int id) {
		return userRepo.findById(id);
	}
}
