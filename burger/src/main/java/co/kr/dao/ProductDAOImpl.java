package co.kr.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import co.kr.vo.CartVO;
import co.kr.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	SqlSession sqlSession;

	//제품 목록
	@Override
	public List<ProductVO> productList(String pCategory) throws Exception {
		
		return sqlSession.selectList("productMapper.productList", pCategory);
	}
	
	//제품 상세보기
	@Override
	public ProductVO productDetail(String pCode) throws Exception {
		
		return sqlSession.selectOne("productMapper.productDetail", pCode);
	}

	//장바구니 담기
	@Override
	public void addCart(CartVO cartVO) throws Exception {
		
		sqlSession.insert("cartMapper.addCart", cartVO);
	}
	
	
	
}
