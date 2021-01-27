package co.kr.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import co.kr.dao.MemberDAO;
import co.kr.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject 
	MemberDAO dao;

	@Override
	public void register(MemberVO memberVO) throws Exception {
		
		dao.register(memberVO);
		
	}

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		
		return dao.login(memberVO);
	}

	@Override
	public void update(MemberVO memberVO) throws Exception {
		
		dao.update(memberVO);
		
	}

	@Override
	public void delete(MemberVO memberVO) throws Exception {
		
		dao.delete(memberVO);
		
	}

	@Override
	public int pwdChk(MemberVO memberVO) throws Exception {
		
		int result = dao.pwdChk(memberVO);
		return result;
	}

	@Override
	public int idChk(MemberVO memberVO) throws Exception {
		
		int result = dao.idChk(memberVO);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
