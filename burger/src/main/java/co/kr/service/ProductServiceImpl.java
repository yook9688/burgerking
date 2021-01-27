package co.kr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import co.kr.dao.ProductDAO;
import co.kr.vo.CartVO;
import co.kr.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductDAO dao;

	@Override
	public List<ProductVO> productList(String pCategory) throws Exception {
		
		return dao.productList(pCategory);
	}

	@Override
	public ProductVO productDetail(String pCode) throws Exception {
		
		return dao.productDetail(pCode);
	}

	@Override
	public void addCart(CartVO cartVO) throws Exception {
		
		dao.addCart(cartVO);
		
	}
	
	
	
	
	
	
}
