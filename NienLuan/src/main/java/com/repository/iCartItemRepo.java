package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.CartItemEntity;
import com.entity.UserEntity;
@Repository
public interface iCartItemRepo extends JpaRepository<CartItemEntity, Integer>{
	public List<CartItemEntity> findByRefUser(UserEntity user);
	
	

}
