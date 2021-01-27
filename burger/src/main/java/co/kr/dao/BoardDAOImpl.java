package co.kr.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import co.kr.vo.BoardVO;
import co.kr.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
		
	}

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		//boardMapper.xml에서 mapper의 namespace가 boardMapper이고 그 안에 쿼리 중 id가 list인 것을 가져와서 반환하라
		return sqlSession.selectList("boardMapper.listPage", scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("boardMapper.listCount", scri);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		
		return sqlSession.selectOne("boardMapper.read", bno);
	}

	@Override
	public void update(BoardVO boardVO) throws Exception {

		sqlSession.update("boardMapper.update", boardVO);
		
	}

	@Override
	public void delete(int bno) throws Exception {

		sqlSession.delete("boardMapper.delete", bno);
		
	}

	@Override
	public void boardHit(int bno) throws Exception {
		
		sqlSession.update("boardMapper.boardHit", bno);
		
	}
	
	
	
	
	
	
	
	
	
}
