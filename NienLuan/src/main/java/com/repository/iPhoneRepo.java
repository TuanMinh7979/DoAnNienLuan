package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.PhoneEntity;

@Repository
public interface iPhoneRepo extends JpaRepository<PhoneEntity, Integer>{
	PhoneEntity findById(int id);
	

}
