package dasi.web.service;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import dasi.web.domain.CommunityDTO;
import dasi.web.domain.PageDTO;


public interface CommunityService {
	
	// 글쓰기
	public void communityWrite(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception;
	
	// 커뮤니티 리스트
	public ArrayList<CommunityDTO> communityList(PageDTO pageDTO);
	
	// 글 상세보기
	public CommunityDTO communityView(int communityNo);
	
	// 글 수정하기
	public int communityModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception;
	
	// 글 비밀번호 확인
	public CommunityDTO communityPwChk(CommunityDTO communityDTO);
	
	// 전체 게시글 수
	public int totalCnt(PageDTO pageDTO);
	
	// 글 삭제하기
	public int communityRemove(int communityNo);
}
