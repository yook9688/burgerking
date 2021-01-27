package co.kr.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import co.kr.vo.CartVO;
import co.kr.vo.OrderVO;
@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	SqlSession sqlSession;
	
	// 카트정보불러오기
	@Override
	public List<CartVO> cartList(String userId) throws Exception {
		
		return sqlSession.selectList("cartMapper.cartList", userId);
	}
	
	// 주문 입력
	@Override
	public void order(OrderVO orderVO) throws Exception {
		
		sqlSession.insert("orderMapper.order", orderVO);
		sqlSession.insert("orderMapper.order_details", orderVO);
		
	}
	
	// 주문 입력 후 장바구니 초기화
	@Override
	public void cartClear(String userId) throws Exception {
		
		sqlSession.delete("cartMapper.cartClear", userId);
		
	}
	
	// 주문 목록
	@Override
	public List<OrderVO> orderList(String userId) throws Exception {
		
		return sqlSession.selectList("orderMapper.orderList", userId);
	}
	
	// 주문 상세보기
	@Override
	public List<OrderVO> orderDetail(OrderVO orderVO) throws Exception {
		
		return sqlSession.selectList("orderMapper.orderDetail", orderVO);
	}
	
	
	
	
	

	
}
