package com.controller.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.entity.CartItemEntity;
import com.entity.CommentEntity;
import com.entity.OrderDetailEntity;
import com.entity.OrderEntity;
import com.entity.PhoneEntity;
import com.entity.ReviewEntity;
import com.entity.TransferModel;
import com.entity.UserEntity;
import com.service.CartItemService;
import com.service.CommentService;
import com.service.OrderDetailService;
import com.service.OrderService;
import com.service.PhoneService;
import com.service.ReviewService;
import com.service.UserService;

@Controller
public class HomeController {

	@Autowired
	private PhoneService phoneService;
	@Autowired
	private UserService userService;
	@Autowired
	private CartItemService cartItemService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ReviewService reviewService;
	
	

	@GetMapping(value = "/")
	public ModelAndView index(@PathVariable(required = false, name = "page") Integer pageIdx,
			@PathVariable(required = false, name = "limit") Integer limit) {
		if (pageIdx == null && limit == null) {

			return showPhone(1, 15);
		} else {
			return showPhone(pageIdx, limit);
		}
	}

	@PostMapping(value = "/")
	public ModelAndView showPhone(@RequestParam("page") int pageIdx, @RequestParam("limit") int limit) {

		TransferModel<PhoneEntity> model = new TransferModel<PhoneEntity>();
		Pageable pageable = new PageRequest(pageIdx - 1, limit);
		int rssize = phoneService.getTotalItem();
		int totalPage = rssize % limit == 0 ? rssize / limit : rssize / limit + 1;

		model.setPageIdx(pageIdx);
		model.setTotalPage(totalPage);
		model.setListResult(phoneService.findAll(pageable));
		ModelAndView mav = new ModelAndView("web/webhome");
		mav.addObject("model", model);

		return mav;

	}

	@GetMapping(value = "/phone/{id}")
	public String showProductDetail(@PathVariable(value = "id") int inpid,  Model model, HttpSession session) {
		int idLoggedUser = (int) session.getAttribute("userid");
		UserEntity user = userService.findById(idLoggedUser);
		PhoneEntity phonei = phoneService.findById(inpid);
		
		List<ReviewEntity> reviews=reviewService.findByRefUser(user);
		List<ReviewEntity> reviewsofphone=new ArrayList<>();
		for(ReviewEntity reviewi : reviews) {
			reviewsofphone=reviewService.findByRefPhone(phonei);
		}
		if(reviewsofphone.size()>0) {
		  model.addAttribute("rate", reviewsofphone.get(0).getRate());
		}
		model.addAttribute("phonei", phonei);
		List<CommentEntity> commentList= commentService.findByRefPhone(phonei);
		if(commentList.size()>0) {
		   for(CommentEntity commenti : commentList) {
			   commenti.setTenkhachhang(userService.findById(commenti.getRefUser().getId()).getTentaikhoan());
			   
		   }
			
			model.addAttribute("commentList", commentList);
		}
		

		return "web/productdetail";

	}

	@GetMapping(value = "/xem-gio")
	public ModelAndView showCartItems(HttpSession session) {

		int idLoggedUser = (int) session.getAttribute("userid");
		UserEntity user = userService.findById(idLoggedUser);
		List<CartItemEntity> cartItemList = cartItemService.findByRefUser(user);
		ModelAndView mav = null;
		if (cartItemList.size()>0) {
			mav = new ModelAndView("web/cartitems");
			List<PhoneEntity> cartItemProductList = new ArrayList<>();
			for (CartItemEntity cartItemi : cartItemList) {
				//find 11
				cartItemProductList.add(phoneService.findById(cartItemi.getRefPhone().getId()));
			}
			mav.addObject("itemList", cartItemList);
			mav.addObject("itemproductList", cartItemProductList);
			mav.addObject("user", user);
			
		} else {
			mav = new ModelAndView("web/nonecartitems");
		}
		return mav;
	}

	@GetMapping(value = "/lich-su-don-hang")
	public String showOrderHistory(HttpSession session, Model model) {
		int idLoggedUser = (int) session.getAttribute("userid");
		UserEntity user = userService.findById(idLoggedUser);
		List<OrderEntity> orderList= orderService.findByRefUser(user);
		
		ArrayList<ArrayList<OrderDetailEntity>> manyOrderDetailList = new ArrayList<ArrayList<OrderDetailEntity>>();
		for(OrderEntity orderi : orderList) {
			ArrayList<OrderDetailEntity> orderdetailList=orderDetailService.findByRefOrder(orderi);
			
			for(OrderDetailEntity orderdetaili : orderdetailList) {
			  orderdetaili.setTensanphamcur(phoneService.findById(orderdetaili.getRefPhone().getId()).getTensanpham());
			}
			manyOrderDetailList.add(orderdetailList);
		}
		model.addAttribute("itemList", orderList);
		model.addAttribute("manyitemDetailList", manyOrderDetailList);
		model.addAttribute("user", user);
		
		
		return "web/orderhistory";
	}
	
	//api he thong goi y

	
}
