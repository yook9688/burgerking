package co.kr.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.kr.service.MemberService;
import co.kr.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		logger.info("get register");
		
		return "/member/register";
		
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO memberVO, HttpSession session) throws Exception {
		logger.info("post register");
		
		int result = service.idChk(memberVO);
		try {
			if(result == 1) {
				return "/member/register";
			} else if(result == 0) {
				service.register(memberVO);
				System.out.println(memberVO.getUserBirth());
				session.setAttribute("member", memberVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/loginView", method = RequestMethod.GET)
	public void loginView() throws Exception {
		logger.info("loginView");
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post login");
		
		HttpSession session = req.getSession();
		MemberVO login = service.login(memberVO);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addAttribute("msg", false);
			System.out.println("로그인 실패");
		} else {
			session.setAttribute("member", login);
			System.out.println("로그인 성공");
			
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		logger.info("logout");
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView() throws Exception {
		logger.info("updateView");
		
		return "member/updateView";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(MemberVO memberVO) throws Exception {
		logger.info("member update");
		
		service.update(memberVO);
		
		return "redirect:/";
	}
	
	@RequestMapping(value ="/deleteView", method = RequestMethod.GET)
	public String deleteView() throws Exception {
		
		return "member/deleteView";
	}
	
	@RequestMapping(value ="/delete", method = RequestMethod.POST)
	public String delete(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		//세션에 있는 member를 가져와 member 변수에 넣어줍니다.
		MemberVO member = (MemberVO) session.getAttribute("member");
		//세션에 있는 비밀번호
		String sessionPwd = member.getUserPwd();
		// memberVO로 들어오는 비밀번호
		String voPwd = memberVO.getUserPwd();
		
		if(!(sessionPwd.equals(voPwd))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/deleteView";
		}
		service.delete(memberVO);
		session.invalidate();
		return "redirect:/";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdChk", method = RequestMethod.POST)
	public int pwdChk(MemberVO memberVO) throws Exception {
		
		int result = service.pwdChk(memberVO);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO memberVO) throws Exception {
		
		int result = service.idChk(memberVO);
		
		return result;
		
	}
}
