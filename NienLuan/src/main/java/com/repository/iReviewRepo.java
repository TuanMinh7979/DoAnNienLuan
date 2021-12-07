package com.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.PhoneEntity;
import com.entity.ReviewEntity;
import com.entity.UserEntity;

@Repository
public interface iReviewRepo extends JpaRepository<ReviewEntity, Integer> {
	public ArrayList<ReviewEntity> findByRefPhone(PhoneEntity phone);
	public ArrayList<ReviewEntity> findByRefUser(UserEntity user);

}
