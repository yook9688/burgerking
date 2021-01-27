package co.kr.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.service.CartService;
import co.kr.service.ProductService;
import co.kr.vo.CartVO;
import co.kr.vo.MemberVO;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Inject
	CartService service;
	
	@Inject
	ProductService pService;
	
	
	@RequestMapping(value = "/addCart1", method = RequestMethod.POST)
	public String addCart1(CartVO cartVO, HttpSession session) throws Exception {
		logger.info("add cart1");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		cartVO.setUserId(member.getUserId());
		
		service.addCart1(cartVO);
		
		
		return "redirect:/cart/prolist?cate=ss";
		
	}
	
	@RequestMapping(value = "/addCart2", method = RequestMethod.POST)
	public String addCart2(CartVO cartVO, HttpSession session) throws Exception {
		logger.info("add cart2");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		cartVO.setUserId(member.getUserId());
		
		service.addCart2(cartVO);
		
		
		return "redirect:/cart/prolist?cate=ss";
		
	}
	
	//제품 목록
	@RequestMapping(value="/prolist", method = RequestMethod.GET)
	public String productList(Model model,@RequestParam("cate") String pCategory) throws Exception {
		logger.info("product list");
		
		model.addAttribute("product", pService.productList(pCategory));
		
		return "cart/prolist";
	}
	
	// 제품 상세보기
	@RequestMapping(value="/prodetail", method = RequestMethod.GET)
	public String prodetail(Model model, @RequestParam("c") String pCode, @RequestParam("cate") String pCategory) throws Exception {
		logger.info("product detail");
		
		model.addAttribute("product", pService.productDetail(pCode));
		
		return "cart/prodetail";
	}
	
	
	@RequestMapping(value = "/cartlist", method = RequestMethod.GET)
	public String cartList(HttpSession session, Model model ) throws Exception {
		logger.info("cart list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
			
		model.addAttribute("cartList", service.cartList(userId));
		
		return "cart/cartlist";
	}

	
	@RequestMapping(value = "/cartDelete", method = RequestMethod.GET)
	public String cartDelete(CartVO cartVO) throws Exception {
		logger.info("delete cart");
		
		service.cartDelete(cartVO);
		return "redirect:/cart/cartlist";
	}
	
	
}
