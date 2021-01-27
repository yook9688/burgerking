package co.kr.service;

import java.util.List;

import co.kr.vo.CartVO;

public interface CartService {

	public void addCart1(CartVO cartVO) throws Exception;
	
	public void addCart2(CartVO cartVO) throws Exception;
	
	public List<CartVO> cartList(String userId) throws Exception;
	
	public void cartDelete(CartVO cartVO) throws Exception;
}
