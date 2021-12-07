package com.controller.web;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.UserEntity;
import com.service.UserService;

@Controller
public class AuthorController {
	@Autowired
	private UserService userService;
	

	@GetMapping(value = "/dang-nhap")
	public String showLoginForm(Model model) {
            UserEntity inpUser= new UserEntity();	
            model.addAttribute("user", inpUser);
		
		return "web/login";
	}

	@PostMapping(value = "/dang-nhap")
	public String handleFormLogin(@ModelAttribute("user") UserEntity inpUser, Model model, HttpSession session) {
		UserEntity user=userService.findByTentaikhoan(inpUser.getTentaikhoan());
		String tentaikhoanmes=null;
		String matkhaumes=null;
		
		
		if(user==null){
			tentaikhoanmes="Tài khoản không tồn tại";
			model.addAttribute("tentaikhoanmes", tentaikhoanmes);
			return "web/login";
		
			
		}else if(user.getMatkhau().equals(inpUser.getMatkhau())) {
			
//			HashMap<String, String> nameAndroleMap= new HashMap<>();
//			nameAndroleMap.put("tentaikhoan", user.getTentaikhoan());
//			nameAndroleMap.put("role", String.valueOf(user.getRole()));
			session.setAttribute("userid",user.getId());
			session.setAttribute("tentaikhoan",user.getTentaikhoan());
			session.setAttribute("role",String.valueOf(user.getRole()));
			
			return "redirect:/";
			
		}
		
		matkhaumes="Mật khẩu không chính xác";
		model.addAttribute("matkhaumes", matkhaumes);
		
	
		return "web/login";
	}
	@PostMapping(value="/dang-xuat")
	public String handleLogout(HttpSession session) {
		session.removeAttribute("userid");
		session.removeAttribute("tentaikhoan");
		session.removeAttribute("role");
		return "redirect:/";
		
	}
	
	
}
