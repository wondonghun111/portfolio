package com.samsung.sn.service.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.samsung.sn.dto.member.MemberDTO;

public interface IMemberService {
	 public List<MemberDTO> memberList();
	    public void insertMember(MemberDTO dto);
	    
	    //아이디 중복체크
	    public int idChk(MemberDTO dto);
	    
	    //이메일 중복체크
	    public int emailChk(String user_email);
	    //회원 로그인 확인
	    public boolean loginCheck(MemberDTO dto,HttpSession session);
	    //회원 로그인 정보
	    public MemberDTO viewMember(MemberDTO dto);
	    //회원 로그아웃
	    public void logout(HttpSession session);
	    //이메일 발송
	    public void mailSending(String email, HttpSession session) throws IOException;
	    //이메일 인증번호
	    public List<String> certification(String dice, HttpSession session) throws IOException;
	    //아이디 찾기
	    public Map findID(MemberDTO dto,HttpServletResponse response) throws IOException;
	    //비밀번호 찾기
		public String findPW(MemberDTO dto);
		//비밀번호 찾기 이메일 인증
		public void findPW_email(String email,HttpSession session);
		//비밀번호 찾기 인증번호 확인 로직
		public String findPW_emailNum(String dice,HttpSession session);
		//비밀번호 결과창 프로세스
		public String changePW(MemberDTO dto); 
}
