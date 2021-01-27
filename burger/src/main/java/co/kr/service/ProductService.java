package co.kr.service;

import java.util.List;

import co.kr.vo.CartVO;
import co.kr.vo.ProductVO;

public interface ProductService {
	
	//제품 목록
	public List<ProductVO> productList(String pCategory) throws Exception;
	
	//제품 상세보기
	public ProductVO productDetail(String pCode) throws Exception;
	
	public void addCart(CartVO cartVO) throws Exception;
	
}
