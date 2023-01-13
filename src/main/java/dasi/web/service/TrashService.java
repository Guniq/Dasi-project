package dasi.web.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import dasi.web.domain.PageDTO;
import dasi.web.domain.TrashDTO;

public interface TrashService {
	
	// 쓰레기 등록
	public void trashRegister(MultipartHttpServletRequest mhRequest, HttpServletRequest request);
	
	// 쓰레기 리스트
	public ArrayList<TrashDTO> trashList(PageDTO pageDTO);
	
	// 전체 글 수
	public int totalCnt(PageDTO pageDTO);
	
	// 쓰레기 상세보기
	public TrashDTO trashView(int trashNo, String mode, HttpServletRequest request, HttpServletResponse reponse);
	
	// 쓰레기 수정
	public int trashModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request);
	
	// 쓰레기 삭제
	public int trashRemove(int trashNo);
	
	// 조회수 순 쓰레기 리스트
	public ArrayList<TrashDTO> trashHitList();
}
