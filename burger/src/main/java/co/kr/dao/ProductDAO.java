package co.kr.dao;

import java.util.List;

import co.kr.vo.CartVO;
import co.kr.vo.ProductVO;

public interface ProductDAO {

	public List<ProductVO> productList(String pCategory) throws Exception;
	
	public ProductVO productDetail(String pCode) throws Exception;
	
	//장바구니 담기
	public void addCart(CartVO cartVO) throws Exception;
	
}
