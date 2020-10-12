package com.samsung.sn.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.samsung.sn.dto.member.MemberDTO;
import com.samsung.sn.service.member.MemberService;

@Controller
public class MemberController {
	@Autowired
	@Inject
	private MemberService memberService;

	@Inject
	JavaMailSender mailSender;

	// 회원가입
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	@ResponseBody
	public void insertMember(@RequestBody MemberDTO dto) {
		dto.toString();
		memberService.insertMember(dto);

	}

	// 회원가입 완료
	@RequestMapping(value = "/member_result")
	public String result() {
		return "member_complete";
	}

	@RequestMapping(value = "/join")
	public String memberJoin() {
		return "member_join";
	}

	@RequestMapping(value = "/map")
	public String company_map() {
		return "company_map";
	}

	// 아이디 - 비밀번호 찾기
	@RequestMapping(value = "/find_id", method = { RequestMethod.GET, RequestMethod.POST })
	public String memberfind_id() {
		return "member_find_id";
	}

	@RequestMapping(value = "/find_pw", method = { RequestMethod.GET, RequestMethod.POST })
	public String memberfind_pw() {
		return "member_find_pw";
	}

	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/member_find_id", method = RequestMethod.POST)
	public ModelAndView memberfind_id_result(MemberDTO dto, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		ModelAndView mv = new ModelAndView();
		Map result = memberService.findID(dto, response);
		if (result != null) {
			mv.setViewName("forward:/member_find_id_result");
			mv.addObject("user_id", result.get("user_id"));
			mv.addObject("create_date", result.get("create_date"));
		}
		return mv;
	}

	// 비밀번호 찾기
	@ResponseBody
	@RequestMapping(value = "/member_finding_pw", method = { RequestMethod.POST })
	public String member_find_pw(@RequestBody MemberDTO dto, HttpSession session) {
		String result = memberService.findPW(dto);
		System.out.println("결과 값 : " + result);
		session.setAttribute("user_email", dto.getUser_email());
		session.setAttribute("user_name", dto.getUser_name());
		session.setAttribute("user_id", dto.getUser_id());
		if (result != null) {
			return result;
		} else {
			return null;
		}
	}

	// 아이디 찾기 결과
	@RequestMapping(value = "/member_find_id_result", method = RequestMethod.POST)
	public void member_find_id_result() {

	}

	// 비밀번호 프로세스
	@RequestMapping(value = "/member_find_pw_process", method = { RequestMethod.GET, RequestMethod.POST })
	public String member_find_pw_process() {
		return "member_find_pw_process";
	}

	// 비밀번호 프로세싱 cert_check버튼
	@ResponseBody
	@RequestMapping(value = "/member_find_pw_processing", method = RequestMethod.POST)
	public String member_find_pw_processing(@RequestBody String email, HttpSession session) {
		memberService.findPW_email(email, session);
		return "member_find_pw_process";
	}

	// 비밀번호 프로세싱 code_confirm버튼
	@ResponseBody
	@RequestMapping(value = "/member_find_pw_processing2", method = RequestMethod.POST)
	public String member_find_pw_processing2(@RequestBody String dice, HttpSession session) {
		return memberService.findPW_emailNum(dice, session);
	}

	// 비밀번호 변경 결과창
	@RequestMapping(value = "/member_find_pw_result")
	public String member_find_pw_result() {
		return "member_find_pw_result";
	}

	// 비밀번호 변경 결과창 프로세스
	@ResponseBody
	@RequestMapping(value = "/member_find_pw_result_process", method = RequestMethod.POST)
	public String member_find_pw_result_process(@RequestBody MemberDTO dto) {
		dto.toString();
		return memberService.changePW(dto);
	}

	@RequestMapping(value = "/email_result")
	public String email_result() {
		return "email_result";
	}

	// 이메일 인증 페이지 맵핑 메소드
	@RequestMapping("/email")
	public String email() {
		return "email";
	}

	// 이메일 발송 코드
	@ResponseBody
	@RequestMapping(value = "/auth", method = RequestMethod.POST)
	public void mailSending(@RequestParam("user_email") String email, HttpSession session) throws IOException {
		System.out.println("auth실행");
		System.out.println(email.toString());
		memberService.mailSending(email, session);
	}

	// 이메일 인증 번호 검사
	@ResponseBody
	@RequestMapping(value = "/certification", method = RequestMethod.POST)
	public List<String> certification(@RequestParam("dice") String dice, HttpSession session) throws IOException {
		List<String> list = memberService.certification(dice, session);
		return list;
	}

	@RequestMapping(value = "/clause", method = { RequestMethod.GET })
	public String cluseMember() {
		return "member_clause";
	}

	// 메인화면
	@RequestMapping(value = "/main")
	public String main() {
		return "main";
	}

	// 로그인 폼 화면
	@RequestMapping(value = "/loginform")
	public String loginForm() {
		return "loginform";
	}

	// 로그인 로직

	@RequestMapping(value = "/loginlogic", method = RequestMethod.POST)
	public ModelAndView loginlogic(@ModelAttribute MemberDTO dto, HttpSession session, HttpServletResponse response)
			throws IOException {
		boolean result = memberService.loginCheck(dto, session);
		response.setContentType("text/html; charset=UTF-8");
		ModelAndView mv = new ModelAndView();
		if (result == true) {
			mv.setViewName("redirect:/main"); 
			
		} else {
			System.out.println("null이면 실행");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('입력한 정보에 해당하는 계정이 없습니다.');</script>");
			out.println("<script>history.back();</script>");
			out.flush();
			mv.setViewName("/loginform");
			
		}
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView mv = new ModelAndView();
		if (error != null) {
			mv.addObject("error", "Invalid username and password!");
		}
		if (logout != null) {
			mv.addObject("msg", "You've been logged out successfullt.");
		}
		mv.setViewName("login");
		return mv;

	}

	// 로그아웃
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		memberService.logout(session);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/main");
//		mav.addObject("msg","logout");
		return mv;
	}

	// 아이디중복체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(MemberDTO dto) {
		int result = memberService.idChk(dto);
		return result;
	}

	// 아이디중복체크
	@ResponseBody
	@RequestMapping(value = "/emailChk", method = RequestMethod.POST)
	public int emailChk(String user_email) {
		int result = memberService.emailChk(user_email);
		return result;
	}
}
