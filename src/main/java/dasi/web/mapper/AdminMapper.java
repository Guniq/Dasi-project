package dasi.web.mapper;

import java.util.ArrayList;

import dasi.web.domain.AdminDTO;
import dasi.web.domain.CommunityDTO;
import dasi.web.domain.PageDTO;

public interface AdminMapper {
	
	// 관리자 로그인
	public String adminLogin(AdminDTO adminDTO);
	
	// 커뮤니티 공지사항 리스트
	public ArrayList<CommunityDTO> communitySelect(PageDTO pageDTO);
	
	// 리스트 전체 수
	public int totalCnt(PageDTO pageDTO);
}
