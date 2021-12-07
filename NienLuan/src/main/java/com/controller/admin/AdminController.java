package com.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.entity.UserEntity;
import com.service.UserService;
@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	
	
	@GetMapping("/ad")
	public String index(HttpSession session) {
		int idLoggedUser = (int) session.getAttribute("userid");
		UserEntity user = userService.findById(idLoggedUser);
		if(user!=null){
			if(user.getRole()==2) {
				return "redirect:/";
			}
			return "admin/adminhome";
		}
		//nguoc lai neu user chua dang nhap
		return "web/login";

	}
	
}
