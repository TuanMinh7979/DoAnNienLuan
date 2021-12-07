package com.api;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.entity.CartItemEntity;
import com.entity.OrderDetailEntity;
import com.entity.OrderEntity;
import com.entity.UserEntity;
import com.service.CartItemService;
import com.service.OrderDetailService;
import com.service.OrderService;
import com.service.UserService;

@RestController
public class OrderApi {
	
	@Autowired
	private CartItemService cartItemService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@PostMapping(value = "/api/order")
	public int create(@RequestBody Map<String, String> inpinfo) {
		OrderEntity order= new OrderEntity();
		order.setTinhtrang(inpinfo.get("tinhtrang"));
		order.setThanhtien(Integer.valueOf(inpinfo.get("thanhtien")));
		order.setDiachinhanhang(inpinfo.get("diachinhanhang"));
		order.setRefUser(userService.findById(Integer.valueOf(inpinfo.get("idKhachhang"))));
		
		OrderEntity addedOrder= orderService.save(order);
		
		UserEntity user= userService.findById(addedOrder.getRefUser().getId());
		List<CartItemEntity> cartItemList=cartItemService.findByRefUser(user);
		List<Integer> cartItemIdList=new ArrayList<>();
		
		
		OrderDetailEntity orderDetail= null;
		
		for(CartItemEntity cartitemi: cartItemList) {
			cartItemIdList.add(cartitemi.getId());
			orderDetail= new OrderDetailEntity();
			orderDetail.setRefOrder(addedOrder);
			orderDetail.setSoluong(cartitemi.getSoluong());
			orderDetail.setRefPhone(cartitemi.getRefPhone());
			orderDetailService.save(orderDetail);
		}
		//xoa gio hang hien tai 
		for(Integer idtoDel : cartItemIdList) {
			cartItemService.deleteById(idtoDel);
			
		}
		
		
		
	    
		
		return addedOrder.getId();
	}
	
	@DeleteMapping("/api/order")
	public void delete(@RequestBody int id) {
		
		OrderEntity ordertoDel= orderService.findById(id);
		List<OrderDetailEntity> listOrderdetail=orderDetailService.findByRefOrder(ordertoDel);
		List<Integer> listIdTodel= new ArrayList<>();
		for(OrderDetailEntity orderdetaili : listOrderdetail) {
			listIdTodel.add(orderdetaili.getId());
			
		}
		for(Integer idtoDeli :listIdTodel) {
			orderDetailService.deleteById(idtoDeli);
		}
		orderService.deleteById(ordertoDel.getId());
	}
	
	
	

}
