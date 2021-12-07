package com.api.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.entity.CartItemEntity;
import com.service.CartItemService;
import com.service.PhoneService;
import com.service.UserService;

@RestController
public class CartItemApi {
	@Autowired
	private CartItemService cartItemService;

	@Autowired
	private UserService userService;

	@Autowired
	private PhoneService phoneService;

	

//	@RequestMapping(value = "/api/web/cartitem", method = RequestMethod.POST, produces = "application/json")
	@PostMapping(value = "/api/web/cartitem")
	public int create(@RequestBody Map<String, String> inpinfo) {
		
		CartItemEntity cartitem= new CartItemEntity();
		cartitem.setSoluong(Integer.valueOf(inpinfo.get("soluong")));
		cartitem.setRefUser(userService.findById(Integer.valueOf(inpinfo.get("idKhachhang"))));
		cartitem.setRefPhone(phoneService.findById(Integer.valueOf(inpinfo.get("idSanpham"))));
		CartItemEntity addedCartitem= cartItemService.save(cartitem);
		//return id san pham vua them
		return addedCartitem.getId();
		
		
	}
	
	@DeleteMapping("/api/web/cartitem")
	public void delete(@RequestBody int id) {
		cartItemService.deleteById(id);
		
	}

}
