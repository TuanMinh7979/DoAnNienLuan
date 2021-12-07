package com.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.OrderDetailEntity;
import com.entity.OrderEntity;
@Repository
public interface iOrderDetailRepo extends JpaRepository<OrderDetailEntity, Integer>{
	public ArrayList<OrderDetailEntity> findByRefOrder(OrderEntity order);
}
