package com.api.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.entity.ReviewEntity;
import com.service.PhoneService;
import com.service.ReviewService;
import com.service.UserService;

@RestController
public class ReviewApi {
	@Autowired
	private UserService userService;

	@Autowired
	private PhoneService phoneService;
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping(value = "/api/web/review")
	public int create(@RequestBody Map<String, String> inpinfo) {
		ReviewEntity review= new ReviewEntity();
		review.setRate(Integer.valueOf(inpinfo.get("rate")));
		review.setRefPhone(phoneService.findById(Integer.valueOf(inpinfo.get("idSanpham"))));
		review.setRefUser(userService.findById(Integer.valueOf(inpinfo.get("idKhachhang"))));
		review.setIdphone(Integer.valueOf(inpinfo.get("idSanpham")));
		ReviewEntity savedReview=reviewService.save(review);
		return savedReview.getId();
		
	}
	
	@DeleteMapping("/api/web/review")
	public void delete(@RequestBody int id) {
		reviewService.deleteById(id);
		
	}
}
