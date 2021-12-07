package com.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.CommentEntity;
import com.entity.PhoneEntity;
import com.repository.iCommentRepo;
@Service
public class CommentService {
	@Autowired
	private iCommentRepo commentrepo;

	public CommentEntity save(CommentEntity comment) {
		// TODO Auto-generated method stub
		return commentrepo.save(comment); 
	}
	public ArrayList<CommentEntity> findByRefPhone(PhoneEntity phone){
		return commentrepo.findByRefPhone(phone);
	}
	public void deleteById(int id) {
		commentrepo.deleteById(id);
		
	}

}
