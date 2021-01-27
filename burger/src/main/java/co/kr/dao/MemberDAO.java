package co.kr.dao;

import co.kr.vo.MemberVO;

public interface MemberDAO {

	// 회원 가입
	public void register(MemberVO memberVO) throws Exception;
	
	// 회원 로그인
	public MemberVO login(MemberVO memberVO) throws Exception;
	
	// 회원 정보수정
	public void update(MemberVO memberVO) throws Exception;
	
	// 회원 탈퇴
	public void delete(MemberVO memberVO) throws Exception;
	
	// 패스워드 체크
	public int pwdChk(MemberVO memberVO) throws Exception;
	
	// 아이디 중복체크
	public int idChk(MemberVO memberVO) throws Exception;
}

