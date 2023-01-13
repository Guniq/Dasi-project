package dasi.web.mapper;

import java.util.ArrayList;

import dasi.web.domain.PageDTO;
import dasi.web.domain.TrashDTO;

public interface TrashMapper {
	
	// 쓰레기 등록
	public void trashInsert(TrashDTO trashDTO);
	
	// 쓰레기 리스트
	public ArrayList<TrashDTO> trashList(PageDTO pageDTO); 
	
	// 리스트 전체 수
	public int totalCnt(PageDTO pageDTO);
	
	// 쓰레기 상세보기
	public TrashDTO trashView(int trashNo);
	
	// 쓰레기 수정하기
	public int trashUpdate(TrashDTO trashDTO);
	
	// 쓰레기 삭제하기
	public int trashDelete(int trashNo);
	
	// 조회수 업데이트
	public void hitAdd(int trashNo);
	
	// 조회수 순 쓰레기 리스트
	public ArrayList<TrashDTO> trashHitList();
}
