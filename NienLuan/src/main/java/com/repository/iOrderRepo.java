package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.OrderEntity;
import com.entity.UserEntity;
@Repository
public interface iOrderRepo extends JpaRepository<OrderEntity, Integer>{
	public List<OrderEntity> findByRefUser(UserEntity user);
	 OrderEntity findById(int id);

}
