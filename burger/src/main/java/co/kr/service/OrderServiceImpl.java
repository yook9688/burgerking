package co.kr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import co.kr.dao.OrderDAO;
import co.kr.vo.CartVO;
import co.kr.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	OrderDAO dao;

	
	
	@Override
	public List<CartVO> cartList(String userId) throws Exception {
		
		return dao.cartList(userId);
	}

	@Override
	public void order(OrderVO orderVO) throws Exception {
		
		dao.order(orderVO);
		
	}

	@Override
	public void cartClear(String userId) throws Exception {
		
		dao.cartClear(userId);
		
	}

	@Override
	public List<OrderVO> orderList(String userId) throws Exception {
		
		return dao.orderList(userId);
	}

	@Override
	public List<OrderVO> orderDetail(OrderVO orderVO) throws Exception {

		return dao.orderDetail(orderVO);
	}
	
	
	
	
	
	
	
}
