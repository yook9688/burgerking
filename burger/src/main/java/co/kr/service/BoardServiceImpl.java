package co.kr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import co.kr.dao.BoardDAO;
import co.kr.vo.BoardVO;
import co.kr.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
		
	}

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		//dao에 있는 list() 함수를 호출해서 반환한다.
		return dao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return dao.listCount(scri);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int bno) throws Exception {
			dao.boardHit(bno);
		return dao.read(bno);
	}

	@Override
	public void update(BoardVO boardVO) throws Exception {

		dao.update(boardVO);
		
	}

	@Override
	public void delete(int bno) throws Exception {

		dao.delete(bno);
		
	}


	
	
	
	
	
	
	
	
}
