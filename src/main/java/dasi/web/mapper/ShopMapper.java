package dasi.web.mapper;

import java.util.ArrayList;

import dasi.web.domain.PageDTO;
import dasi.web.domain.ShopDTO;

public interface ShopMapper {
	
	// 제로웨이스트 샵 등록
	public void shopInsert(ShopDTO shopDTO);
	
	// 제로웨이스트 샵 리스트
	public ArrayList<ShopDTO> shopSelect(PageDTO pageDTO); 
	
	// 리스트 전체 수
	public int totalCnt(PageDTO pageDTO);
	
	// 제로웨이스트 샵 상세보기
	public ShopDTO shopView(int shopNo);
	
	// 제로웨이스트 샵 수정하기
	public int shopUpdate(ShopDTO shopDTO);
	
	// 제로웨이스트 샵 삭제하기
	public int shopDelete(int shopNo);
	
}
