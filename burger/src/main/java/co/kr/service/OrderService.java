package co.kr.service;

import java.util.List;

import co.kr.vo.CartVO;
import co.kr.vo.OrderVO;

public interface OrderService {
	
	public List<CartVO> cartList(String userId) throws Exception;

	public void order(OrderVO orderVO) throws Exception;	
	
	public void cartClear(String userId) throws Exception;
	
	public List<OrderVO> orderList(String userId) throws Exception;
	
	public List<OrderVO> orderDetail(OrderVO orderVO) throws Exception;
}
