package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.CartItemEntity;
import com.entity.UserEntity;
import com.repository.iCartItemRepo;
@Service
public class CartItemService {

	@Autowired
	private iCartItemRepo cartItemRepo;
	
	public CartItemEntity save(CartItemEntity cartItem) {
		return cartItemRepo.save(cartItem);
	}
	public List<CartItemEntity> findByRefUser(UserEntity user){
		return cartItemRepo.findByRefUser(user);
		
	}
	public void deleteById(int id) {
		 cartItemRepo.deleteById(id);
		 
	} 
	
	
	
}
