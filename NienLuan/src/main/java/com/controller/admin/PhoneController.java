package com.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.entity.CommentEntity;
import com.entity.PhoneEntity;
import com.entity.TransferModel;
import com.service.CommentService;
import com.service.PhoneService;
import com.service.UserService;

@Controller
public class PhoneController {

	@Autowired
	PhoneService phoneService;
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/ad/phone")
	public ModelAndView showPhoneMn(@RequestParam("page") int pageIdx, @RequestParam("limit") int limit) {

		TransferModel<PhoneEntity> model = new TransferModel<PhoneEntity>();
		Pageable pageable = new PageRequest(pageIdx - 1, limit);
		int rssize = phoneService.getTotalItem();
		int totalPage = rssize % limit == 0 ? rssize / limit : rssize / limit + 1;

		model.setPageIdx(pageIdx);
		model.setTotalPage(totalPage);
		model.setListResult(phoneService.findAll(pageable));
		ModelAndView mav = new ModelAndView("admin/adminphone");
		mav.addObject("model", model);

		return mav;

	}
	@GetMapping("/ad/phone/add")
	public String showPhoneAdd(Model model)	 {
		PhoneEntity inpPhone = new PhoneEntity();
		model.addAttribute("phone", inpPhone);
	  return "admin/adminphoneadd";
	}
	@GetMapping("/ad/phone/upd/{id}")
	public String showPhoneUpd(@PathVariable(value = "id")int id, Model model)	 {
		PhoneEntity phone= phoneService.findById(id);
		model.addAttribute("phonei", phone);
		
		
		
		return "admin/adminphoneupd";
	}
	
	@GetMapping("/ad/phone/qualityMn/{id}")
	public String showPhoneQuanlityMn(@PathVariable(value = "id")int id, Model model)	 {
		PhoneEntity phone= phoneService.findById(id);
		
		
		List<CommentEntity> commentList= commentService.findByRefPhone(phone);
		if(commentList.size()>0) {
		   for(CommentEntity commenti : commentList) {
			   commenti.setTenkhachhang(userService.findById(commenti.getRefUser().getId()).getTentaikhoan());
			   
		   }
		model.addAttribute("commentList", commentList);
		}
		
		
		return "admin/adminphonequalityMn";
	}
	

}
