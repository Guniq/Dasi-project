package dasi.web.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import dasi.web.domain.AdminDTO;
import dasi.web.domain.CommunityDTO;
import dasi.web.domain.MemberDTO;
import dasi.web.domain.PageDTO;

public interface AdminService {
	
	// 관리자 로그인
	public void adminLogin(AdminDTO adminDTO, HttpServletRequest reqeust);
	
	// 회원리스트
	public ArrayList<MemberDTO> memberList(PageDTO pageDTO);
	
	// 커뮤니티 리스트
	public ArrayList<CommunityDTO> communityList(PageDTO pageDTO);
	
	// 커뮤니티 공지사항 등록
	public void communityWrite(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception;
	
	// 커뮤니티 공지사항 수정 페이지
	public CommunityDTO communityModifyForm(int communityNo);
	
	// 커뮤니티 공지사항 수정 처리
	public int communityModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception;
		
	// 커뮤니티 공지사항 삭제
	public int communityRemove(int communityNo);
	
	// 전체 수
	public int totalCnt(PageDTO pageDTO);
}
