package com.samsung.sn.dao.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.samsung.sn.dto.member.MemberDTO;

@Repository
public class MemberDAO implements IMemberDAO {

	@Inject
	private SqlSession sqlSession;

	//회원가입
	@Override
	public void insertMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("MemberMapper.insertMember", dto);
	}

	@Override
	public void deleteMember(String userid) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean checkPw(String userid, String passwd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MemberDTO viewMember(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMember(MemberDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<MemberDTO> memberList() {
		// TODO Auto-generated method stub
		return null;
	}

	// 아이디 중복 체크
	@Override
	public int idChk(MemberDTO dto) {
		int result = sqlSession.selectOne("MemberMapper.idChk", dto);
		System.out.println(result);
		return result;
	}
	

	// 회원 로그인 체크
	@Override
	public boolean loginCheck(MemberDTO dto) {
		String name = sqlSession.selectOne("MemberMapper.loginChk", dto);
		System.out.println(dto.toString());
		System.out.println(name);
		return (name == null) ? false : true;
	}

	// 회원 로그인 정보
	@Override
	public MemberDTO viewMember(MemberDTO dto) {
		return sqlSession.selectOne("MemberMapper.viewMember", dto);
	}

	// 이메일 중복 체크
	@Override
	public int emailChk(String user_email) {
		int result = sqlSession.selectOne("MemberMapper.emailChk", user_email);		
		System.out.println(result);
		return result;
	}
	// 회원 ID찾기
	@Override
	public Map findID(MemberDTO dto,HttpServletResponse response) throws IOException {
		List list = sqlSession.selectList("MemberMapper.findIDMember",dto);
		Map<String, Object> map = new HashMap<String,Object>();
		response.setContentType("text/html; charset=UTF-8");
		  for(int i =0; i < list.size(); i++) {
		  map = (HashMap)list.get(i);		  
		  }
		  System.out.println(list);
		if( map.isEmpty() == false) {
			return map;
		}
		else {
			System.out.println("NULL이면 실행");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('입력한 정보에 해당하는 계정이 없습니다.');</script>");
			out.println("<script>history.back();</script>");
			out.flush();
			return null;
		}
		
	}
	//회원 PW찾기
	@Override
	public String findPW(MemberDTO dto) {
		String str = sqlSession.selectOne("MemberMapper.findPWMember",dto);
		System.out.println(str);
		return str;
	}
	//회원 비밀번호 변경
	@Override
	public String changePW(MemberDTO dto) {
	return String.valueOf(sqlSession.update("MemberMapper.updateMember",dto));
	
	}

}
