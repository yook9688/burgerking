package co.kr.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	ProductService service;
	
	//제품 목록
	@RequestMapping(value="/prolist", method = RequestMethod.GET)
	public String productList(Model model,@RequestParam("cate") String pCategory) throws Exception {
		logger.info("product list");
		
		model.addAttribute("product", service.productList(pCategory));
		
		return "product/prolist";
	}
	
	// 제품 상세보기
	@RequestMapping(value="/prodetail", method = RequestMethod.GET)
	public String prodetail(Model model, @RequestParam("c") String pCode, @RequestParam("cate") String pCategory) throws Exception {
		logger.info("product detail");
		
		model.addAttribute("product", service.productDetail(pCode));
		
		return "product/prodetail";
	}
	
	
}
