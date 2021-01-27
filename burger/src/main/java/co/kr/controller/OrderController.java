package co.kr.controller;

import java.text.DecimalFormat;
import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.service.OrderService;
import co.kr.vo.MemberVO;
import co.kr.vo.OrderVO;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Inject
	OrderService service;
	
	/*
	 * HttpSession session; MemberVO member = (MemberVO)
	 * session.getAttribute("member");
	 */
	
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public String cartList(HttpSession session, Model model ) throws Exception {
		logger.info("orderView");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
			
		model.addAttribute("cartList", service.cartList(userId));
		
		return "order/orderView";
	}
	
	
	@RequestMapping(value="/order", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO orderVO) throws Exception {
		logger.info("order");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		// orderId 생성
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ymd = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1) + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i=1; i<=8; i++) {
			subNum += (int)(Math.random() * 10);
		}
		String orderId = ymd+"-"+subNum;
		
		orderVO.setOrderId(orderId);
		orderVO.setUserId(userId);
		
		service.order(orderVO);		
		
		service.cartClear(userId);
		
		return "redirect:/order/orderlist";
		
	}
	
	@RequestMapping(value="/orderlist", method = RequestMethod.GET)
	public String orderList(HttpSession session, Model model) throws Exception {
		logger.info("orderList");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		model.addAttribute("orderList", service.orderList(userId));
		
		return "order/orderlist";
	}
	
	@RequestMapping(value="/orderdetail", method = RequestMethod.GET)
	public String orderDetail(HttpSession session, @RequestParam("oId") String orderId, OrderVO orderVO, Model model) throws Exception {
		logger.info("orderDetail");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		orderVO.setUserId(userId);
		orderVO.setOrderId(orderId);
		
		model.addAttribute("orderDetailList", service.orderDetail(orderVO));
		
		return "order/orderdetail";
		
	}
}
