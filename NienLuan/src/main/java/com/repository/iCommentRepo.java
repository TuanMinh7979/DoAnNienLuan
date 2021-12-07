package com.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.CommentEntity;
import com.entity.PhoneEntity;

@Repository
public interface iCommentRepo extends JpaRepository<CommentEntity, Integer> {

	ArrayList<CommentEntity> findByRefPhone(PhoneEntity phone);

	
	
}
