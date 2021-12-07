package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.OrderEntity;
import com.entity.UserEntity;
import com.repository.iOrderRepo;

@Service
public class OrderService {
	
	@Autowired
	private iOrderRepo orderRepo;
	
	public OrderEntity save(OrderEntity order) {
		return orderRepo.save(order);
	}
	public List<OrderEntity> findByRefUser(UserEntity user){
		return orderRepo.findByRefUser(user);
		
	}
	public void deleteById(int id) {
		orderRepo.deleteById(id);
		
	}
	public OrderEntity findById(int id) {
		
		return orderRepo.findById(id);
	}

}
