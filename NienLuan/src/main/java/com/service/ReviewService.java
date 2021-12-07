package com.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.PhoneEntity;
import com.entity.ReviewEntity;
import com.entity.UserEntity;
import com.repository.iReviewRepo;

@Service
public class ReviewService {
	@Autowired
	private iReviewRepo reviewRepo;
	
	public ReviewEntity save(ReviewEntity review) {
		return reviewRepo.save(review);
	}
	public ArrayList<ReviewEntity> findByRefPhone(PhoneEntity phone){
		return reviewRepo.findByRefPhone(phone);
	}
	public ArrayList<ReviewEntity> findByRefUser(UserEntity user){
		return reviewRepo.findByRefUser(user);
	}
	public void deleteById(Integer idtoDeli) {
		reviewRepo.deleteById(idtoDeli);
		
	}
}
