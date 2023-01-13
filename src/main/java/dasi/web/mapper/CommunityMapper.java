package dasi.web.mapper;

import java.util.ArrayList;

import dasi.web.domain.CommunityDTO;
import dasi.web.domain.PageDTO;

public interface CommunityMapper {
	
	// 글쓰기
	public void communityInsert(CommunityDTO communityDTO);
	
	// 커뮤니티 리스트
	public ArrayList<CommunityDTO> communitySelect(PageDTO pageDTO); 
	
	// 리스트 전체 수
	public int totalCnt(PageDTO pageDTO);
	
	// 글 상세보기
	public CommunityDTO communityView(int communityNo);
	
	// 글 수정하기
	public int communityUpdate(CommunityDTO communityDTO);
	
	// 글 삭제하기
	public int communityDelete(int communityNo);
	
	// 글 비밀번호 확인
	public CommunityDTO communityPwChk(CommunityDTO communityDTO);
}
