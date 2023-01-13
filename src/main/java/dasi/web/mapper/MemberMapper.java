package dasi.web.mapper;

import java.util.ArrayList;

import dasi.web.domain.MemberDTO;
import dasi.web.domain.PageDTO;

public interface MemberMapper {
	
	// 회원 가입
	public void memberInsert(MemberDTO memberDTO);
	
	// 로그인
	public MemberDTO memberLogin(MemberDTO memberDTO);
	
	// 마이페이지
	public MemberDTO mypage(int memberNo);
	
	// 회원리스트
	public ArrayList<MemberDTO> memberSelect(PageDTO pageDTO);
	
	// 전체 수
	public int totalCnt(PageDTO pageDTO);
	
	// 아이디 중복확인
	public int memberIdChk(String memberId);
	
	// 닉네임 중복확인
	public int memberNameChk(String memberName);
	
	// 아이디 찾기
	public MemberDTO memberFindId(String memberName);
	
	// 비밀번호 재설정
	public int memberFindPw(MemberDTO memberDTO);
	
	// 회원 수정
	public int memberUpdate(MemberDTO memberDTO);
	
	// 회원 삭제
	public int memberDelete(int memberNo);
}
