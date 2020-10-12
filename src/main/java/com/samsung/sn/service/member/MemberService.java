package com.samsung.sn.service.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.samsung.sn.dao.member.MemberDAO;
import com.samsung.sn.dto.member.MemberDTO;

@Service
public class MemberService implements IMemberService {
	@Autowired
	private MemberDAO memberDao;

	@Inject
	JavaMailSender mailSender;

	@Override
	public List<MemberDTO> memberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public void insertMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		memberDao.insertMember(dto);
	}

	// 아이디 중복 체크
	@Override
	public int idChk(MemberDTO dto) {
		int result = memberDao.idChk(dto);
		return result;
	}

	// 이메일 중복 체크
	@Override
	public int emailChk(String user_email) {
		int result = memberDao.emailChk(user_email);
		return result;
	}

	// 로그인 체크
	@Override
	public boolean loginCheck(MemberDTO dto, HttpSession session) {
		boolean result = memberDao.loginCheck(dto);
		if (result) {
			MemberDTO dto2 = viewMember(dto);
			session.setAttribute("userId", dto2.getUser_id());
			session.setAttribute("userName", dto2.getUser_name());
		}
		return result;
	}

	// 로그인 정보
	@Override
	public MemberDTO viewMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return memberDao.viewMember(dto);
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	// 이메일
	@Override
	public void mailSending(@RequestParam("user_email") String email, HttpSession session) throws IOException {
		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)
		session.setAttribute("server_dice", String.valueOf(dice)); // 이메일 코드 저장

		String setfrom = "dasdas444444444@gmail.com";
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content = System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성
				System.getProperty("line.separator") + "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
				+ System.getProperty("line.separator") + System.getProperty("line.separator") + " 인증번호는 " + dice
				+ " 입니다. " + System.getProperty("line.separator") + System.getProperty("line.separator")
				+ "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(email); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		System.out.println(dice);

	}

	// 이메일 인증번호
	// 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	// 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	// 틀리면 다시 원래 페이지로 돌아오는 메소드
	@Override
	@ResponseBody
	public List<String> certification(@RequestParam("dice") String dice, HttpSession session) throws IOException {
		List<String> list = new ArrayList<String>();
		String Semail_code = (String) session.getAttribute("server_dice"); // 송신 보낸 이메일 인증번호
		String Uemail_code = dice;// 사용자가 보낸 인증 번호
		String pass = "p"; // 인증성공
		String fail = "f"; // 인증실패
		System.out.println("마지막 : Semail_code : " + Semail_code);
		System.out.println("마지막 : Uemail_code : " + Uemail_code);

		// 이메일이 맞을시
		if (Semail_code.equals(Uemail_code)) {
			System.out.println("자바 성공 테스트");
			list.add(pass);
			return list;
			// 인증번호가 틀릴 시
		} else {
			System.out.println("자바 실패 테스트");
			list.add(fail);
			return list;
		}

	}
	//회원 아이디 찾기
	@Override
	public Map findID(MemberDTO dto,HttpServletResponse response) throws IOException {
		Map result = memberDao.findID(dto, response);
		if(result != null) {
		return result;
		} else {
			return null;
		}
	}
	//회원 비밀번호 찾기
	@Override
	public String findPW(MemberDTO dto) {
		String result = memberDao.findPW(dto); //이름 아이디 이메일순
		if(result != null) {
			return result;
		}else {
			return null;
		}
	}
	@Override
	public void findPW_email(@RequestParam("user_email")  String email,HttpSession session) {
		// TODO Auto-generated method stub
		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)
		session.setAttribute("server_dice", String.valueOf(dice)); // 이메일 코드 저장
		
		String setfrom = "dasdas444444444@gmail.com";
		String title = "비밀번호 찾기 인증 이메일 입니다."; // 제목
		String content = System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성
				System.getProperty("line.separator") + "안녕하세요 회원님 저희 홈페이지의 비밀번호 찾기 이메일입니다."
				+ System.getProperty("line.separator") + System.getProperty("line.separator") + " 인증번호는 " + dice
				+ " 입니다. " + System.getProperty("line.separator") + System.getProperty("line.separator")
				+ "받으신 인증번호를 홈페이지에 입력해주세요."; // 내용
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(email); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		System.out.println(dice);
	}

	@Override
	@ResponseBody
	public String findPW_emailNum(@RequestBody String dice, HttpSession session) {
		// TODO Auto-generated method stub
		String Semail_code = String.valueOf(session.getAttribute("server_dice")); // 송신 보낸 이메일 인증번호
		String Uemail_code = dice;// 사용자가 보낸 인증 번호
		String pass = "p"; // 인증성공
		String fail = "f"; // 인증실패
		System.out.println("마지막 : Semail_code : " + Semail_code);
		System.out.println("마지막 : Uemail_code : " + Uemail_code);
		
		if (Semail_code.equals(Uemail_code)) {
			System.out.println("자바 성공 테스트");		
			return pass;
			// 인증번호가 틀릴 시
		} else {
			System.out.println("자바 실패 테스트");
			return fail;
		}
	}

	@Override
	public String changePW(MemberDTO dto) {
		return memberDao.changePW(dto);
	}
	//시큐리티를 이용한 로그인
	public UserDetails loadUserByUsername(MemberDTO dto) {
		memberDao.loginCheck(dto);
		
		if(dto == null) {
			throw new UsernameNotFoundException("No user found with username" + dto.getUser_id());
		}
		
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		
		UserDetails user = new User(dto.getUser_id(),dto.getUser_pw(),roles);
		
		return user;
	}

}
