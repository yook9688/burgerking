package co.kr.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import co.kr.vo.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public void addCart1(CartVO cartVO) throws Exception {
		
		sqlSession.insert("cartMapper.addCart1", cartVO);
		
	}
	
	

	@Override
	public void addCart2(CartVO cartVO) throws Exception {
		
		sqlSession.insert("cartMapper.addCart2", cartVO);
		
	}

	@Override
	public List<CartVO> cartList(String userId) throws Exception {
	
		return sqlSession.selectList("cartMapper.cartList", userId);
	}


	@Override
	public void cartDelete(CartVO cartVO) throws Exception {
		
		sqlSession.delete("cartMapper.cartDelete", cartVO);
		
	}
	
	
	
}
