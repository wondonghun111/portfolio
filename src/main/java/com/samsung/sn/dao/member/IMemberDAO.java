package com.samsung.sn.dao.member;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.samsung.sn.dto.member.MemberDTO;

public interface IMemberDAO {

	
	// 회원목록
    public List<MemberDTO> memberList();
    // 회원가입
    public void insertMember(MemberDTO dto);
    // 회원정보보기
    public MemberDTO viewMember(String userid);
    // 회원삭제
    public void deleteMember(String userid);
    // 회원정보수정
    public void updateMember(MemberDTO dto);
    // 로그인
    public boolean checkPw(String userid, String passwd);
    //아이디 중복체크
    public int idChk(MemberDTO dto);
    //회원 로그인 체크
    public boolean loginCheck(MemberDTO dto);
    //회원 로그인 정보
    public MemberDTO viewMember(MemberDTO dto);
    //이메일 중복체크
    public int emailChk(String user_email);
    //아이디 찾기
    public Map findID(MemberDTO dto,HttpServletResponse response) throws IOException;
    //비멀번호 찾기
    public String findPW(MemberDTO dto);
    //비밀번호 변경
    public String changePW(MemberDTO dto);
}
