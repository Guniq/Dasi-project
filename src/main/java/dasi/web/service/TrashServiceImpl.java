package dasi.web.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dasi.web.domain.PageDTO;
import dasi.web.domain.TrashDTO;
import dasi.web.mapper.TrashMapper;

@Service
public class TrashServiceImpl implements TrashService{
	
	@Autowired
	private TrashMapper trashMapper;
	
	
	// 쓰레기 등록
	@Override
	public void trashRegister(MultipartHttpServletRequest mhRequest, HttpServletRequest request) {
		
		String UPLOAD_DIR = "resources\\uploadFile";
		// 서버 물리적 경로 얻어오기
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		TrashDTO trashDTO = new TrashDTO();
		
		trashDTO.setTrashName(mhRequest.getParameter("trashName"));
		trashDTO.setTrashCategory(mhRequest.getParameter("trashCategory"));
		trashDTO.setTrashContents(mhRequest.getParameter("trashContents"));
		
		MultipartFile file = mhRequest.getFile("trashImage");
		
		if (file.getSize() != 0) {// !file.isEmpty()
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar calender = Calendar.getInstance();
			String sysFileName = format.format(calender.getTime());
			
			sysFileName += file.getOriginalFilename();
			trashDTO.setTrashImage(sysFileName);
			
			File saveFile = new File(uploadPath + "\\" + sysFileName);
			
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			trashDTO.setTrashImage("non");
		}
		
		trashMapper.trashInsert(trashDTO);
	}
	
	// 쓰레기 리스트
	@Override
	public ArrayList<TrashDTO> trashList(PageDTO pageDTO) {
		
		int totalCnt = trashMapper.totalCnt(pageDTO);
		pageDTO.setValue(totalCnt, pageDTO.getCntPerPage());
		
		return trashMapper.trashList(pageDTO);
	}
	
	// 쓰레기 상세보기
	@Override
	public TrashDTO trashView(int trashNo, String mode, HttpServletRequest request, HttpServletResponse response) {
		
		// 조회 수 중복 방지
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null) {
			for (Cookie cookie : cookies) {
	           if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
	           }
	        }
		 if (oldCookie != null) {
		        if (!oldCookie.getValue().contains("["+ trashNo +"]")) {
		        	if(mode.equals("click")) {
		        		trashMapper.hitAdd(trashNo);
		        	}
		            oldCookie.setValue(oldCookie.getValue() + "_[" + trashNo + "]");
		            oldCookie.setPath("/");
		            oldCookie.setMaxAge(60 * 60 * 24);
		            response.addCookie(oldCookie);
		        }
		    } else {
		    	if(mode.equals("click")) {
	        		trashMapper.hitAdd(trashNo);
	        	}
		        Cookie newCookie = new Cookie("postView", "[" + trashNo + "]");
		        newCookie.setPath("/");
		        newCookie.setMaxAge(60 * 60 * 24);
		        response.addCookie(newCookie);
		    }
		}
		
		return trashMapper.trashView(trashNo);
	}
	
	// 쓰레기 수정
	@Override
	public int trashModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request) {
		
		String UPLOAD_DIR = "resources\\uploadFile";
		// 서버 물리적 경로 얻어오기
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		TrashDTO trashDTO = new TrashDTO();
		
		trashDTO.setTrashNo(Integer.parseInt(mhRequest.getParameter("trashNo")));
		trashDTO.setTrashName(mhRequest.getParameter("trashName"));
		trashDTO.setTrashCategory(mhRequest.getParameter("trashCategory"));
		trashDTO.setTrashContents(mhRequest.getParameter("trashContents"));
		
		MultipartFile file = mhRequest.getFile("trashImage");
		
		// 사진이 있어서 수정안했을 경우
		if(file == null) {
			trashDTO.setTrashImage(mhRequest.getParameter("trashImage"));
			
		}else {
			if (file.getSize() != 0) {// !file.isEmpty()
				SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss-");
				Calendar calender = Calendar.getInstance();
				String sysFileName = format.format(calender.getTime());
				
				sysFileName += file.getOriginalFilename();
				trashDTO.setTrashImage(sysFileName);
				
				File saveFile = new File(uploadPath + "\\" + sysFileName);
				
				try {
					file.transferTo(saveFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				trashDTO.setTrashImage("non");
			}
		}
		
		return trashMapper.trashUpdate(trashDTO);
	}
	
	// 쓰레기 삭제
	@Override
	public int trashRemove(int trashNo) {
		
		return trashMapper.trashDelete(trashNo);
	}
	
	// 전체 글 수
	@Override
	public int totalCnt(PageDTO pageDTO) {
		
		return trashMapper.totalCnt(pageDTO);
	}
	
	// 조회수 순 쓰레기 리스트
	@Override
	public ArrayList<TrashDTO> trashHitList() {
		
		return trashMapper.trashHitList();
	}
}
