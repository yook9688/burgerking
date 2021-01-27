package co.kr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import co.kr.dao.CartDAO;
import co.kr.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Inject
	CartDAO dao;

	@Override
	public void addCart1(CartVO cartVO) throws Exception {
		
		dao.addCart1(cartVO);
		
	}
	
	@Override
	public void addCart2(CartVO cartVO) throws Exception {
		
		dao.addCart2(cartVO);
		
	}

	@Override
	public List<CartVO> cartList(String userId) throws Exception {
		
		return dao.cartList(userId);
	}


	@Override
	public void cartDelete(CartVO cartVO) throws Exception {
		
		dao.cartDelete(cartVO);
		
	}
	
	
	
	

}
