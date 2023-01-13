package dasi.web.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import dasi.web.domain.PageDTO;
import dasi.web.domain.ShopDTO;

public interface ShopService {
	
	// 제로웨이스트 샵 등록
	public void shopRegister(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception;
	
	// 제로웨이스트 샵 리스트
	public ArrayList<ShopDTO> shopList(PageDTO pageDTO);

	// 제로웨이스트 샵 상세보기
	public ShopDTO shopView(int shopNo);
	
	// 제로웨이스트 샵 수정
	public int shopModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception;
	
	// 제로웨이스트 샵 삭제
	public int shopRemove(int shopNo);

	// 전체 게시글 수
	public int totalCnt(PageDTO pageDTO);
}
