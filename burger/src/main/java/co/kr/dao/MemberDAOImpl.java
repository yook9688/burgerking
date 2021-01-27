package co.kr.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import co.kr.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject 
	SqlSession sqlSession;
	
	@Override
	public void register(MemberVO memberVO) throws Exception {
	
		sqlSession.insert("memberMapper.memberRegister", memberVO);
		
	}

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		
		return sqlSession.selectOne("memberMapper.memberLogin", memberVO);
		
	}

	@Override
	public void update(MemberVO memberVO) throws Exception {
		
		sqlSession.update("memberMapper.memberUpdate", memberVO);
		
	}

	@Override
	public void delete(MemberVO memberVO) throws Exception {
		
		sqlSession.delete("memberMapper.memberDelete", memberVO);
		
	}

	@Override
	public int pwdChk(MemberVO memberVO) throws Exception {
		
		int result = sqlSession.selectOne("memberMapper.pwdChk", memberVO);
		
		return result;
	}

	@Override
	public int idChk(MemberVO memberVO) throws Exception {
		
		int result = sqlSession.selectOne("memberMapper.idChk", memberVO);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}
