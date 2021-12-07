package com.api.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.entity.PhoneEntity;
import com.entity.ReviewEntity;
import com.entity.UserEntity;
import com.service.PhoneService;
import com.service.ReviewService;
import com.service.UserService;

@RestController
public class UtilApi {
	
	@Autowired
	private UserService userService;

	@Autowired
	private PhoneService phoneService;
	
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping(value = "/api/web/util")
	public String getRecItem(@RequestBody Map<String, String> inpinfo) {
		StringBuilder sb= new StringBuilder();
		UserEntity user=userService.findByTentaikhoan(inpinfo.get("user"));
		
		
		List<ReviewEntity> listItem= reviewService.findByRefUser(user);
		int i=1;
		for(ReviewEntity reviewi : listItem ) {
			if(reviewi.getRate()==5) {
			  PhoneEntity phonei= phoneService.findById(reviewi.getRefPhone().getId());
			sb.append(phonei.getTensanpham()+" ");
			}
			i++;
			
		}
		
		
		
		
		return sb.toString();
	}
	

}
