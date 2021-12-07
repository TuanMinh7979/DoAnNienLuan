package com.api.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.entity.CommentEntity;
import com.service.CommentService;
import com.service.PhoneService;
import com.service.UserService;
@RestController
public class CommentApi {
	
	@Autowired
	private UserService userService;

	@Autowired
	private PhoneService phoneService;
	@Autowired
	private CommentService commentService;
	
	
	
	@PostMapping(value = "/api/web/comment")
	public int create(@RequestBody Map<String, String> inpinfo) {
	CommentEntity comment= new CommentEntity();
	comment.setNoidung(inpinfo.get("noidung"));
	comment.setRefUser(userService.findById(Integer.valueOf(inpinfo.get("idKhachhang"))));
	comment.setRefPhone(phoneService.findById(Integer.valueOf(inpinfo.get("idSanpham"))));
	CommentEntity addedCommentitem= commentService.save(comment);
	//return id san pham vua them
	return addedCommentitem.getId();
	
		
		
	}
	
	@DeleteMapping("/api/web/comment")
	public void delete(@RequestBody int id) {
		commentService.deleteById(id);
		
	}
	

}
