package com.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.OrderDetailEntity;
import com.entity.OrderEntity;
import com.repository.iOrderDetailRepo;
@Service
public class OrderDetailService {

	@Autowired
	private iOrderDetailRepo orderDetailRepo;
	
	public OrderDetailEntity save(OrderDetailEntity orderdetail) {
		return orderDetailRepo.save(orderdetail);
	}
	public ArrayList<OrderDetailEntity> findByRefOrder(OrderEntity order){
		return orderDetailRepo.findByRefOrder(order);
	}
	public void deleteById(Integer idtoDeli) {
		orderDetailRepo.deleteById(idtoDeli);
		
	}
}
