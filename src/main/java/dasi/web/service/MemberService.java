package dasi.web.service;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dasi.web.domain.MemberDTO;

public interface MemberService {
	
	// 회원 가입
	public void memberJoin(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception;
	
	// 로그인
	public MemberDTO memberLogin(MemberDTO memberDTO, HttpServletRequest request, HttpSession session);
	
	// 마이페이지
	public MemberDTO mypage(int memberNo);

	// 아이디 중복확인
	public int memberIdChk(String memberId);
	
	// 닉네임 중복확인
	public int memberNameChk(String memberName);
	
	// 아이디 찾기
	public MemberDTO memberFindId(String memberName);
	
	// 비밀번호 재설정
	public int memberFindPw(MemberDTO memberDTO, Model model);
	
	// 회원 수정
	public int memberModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception;
	
	// 회원 삭제
	public int memberRemove(int memberNo);
	
	// 이메일 인증
	public int joinEmail(String memberEmail);
}
