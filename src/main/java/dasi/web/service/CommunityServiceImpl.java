package dasi.web.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dasi.web.domain.CommunityDTO;
import dasi.web.domain.PageDTO;
import dasi.web.mapper.CommunityMapper;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private CommunityMapper communityMapper;
	
	
	// 글쓰기
	@Override
	public void communityWrite(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception {
		
		String UPLOAD_DIR = "resources\\uploadFile";
		// 서버 물리적 경로 얻어오기
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		CommunityDTO communityDTO = new CommunityDTO();
		
		communityDTO.setCommunityTitle(mhRequest.getParameter("communityTitle"));
		communityDTO.setCommunityCategory(mhRequest.getParameter("communityCategory"));
		communityDTO.setCommunityContents(mhRequest.getParameter("communityContents"));
		communityDTO.setCommunityWriter(mhRequest.getParameter("communityWriter"));
		communityDTO.setCommunityPw(mhRequest.getParameter("communityPw"));
		
		MultipartFile file = mhRequest.getFile("communityImage");
		
		if (file.getSize() != 0) {// !file.isEmpty()
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar calender = Calendar.getInstance();
			String sysFileName = format.format(calender.getTime());
			
			sysFileName += file.getOriginalFilename();
			communityDTO.setCommunityImage(sysFileName);
			
			File saveFile = new File(uploadPath + "\\" + sysFileName);
			
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			communityDTO.setCommunityImage("non");
		}
		
		communityMapper.communityInsert(communityDTO);
	}
	
	// 커뮤니티 리스트
	@Override
	public ArrayList<CommunityDTO> communityList(PageDTO pageDTO) {
		
		int totalCnt = communityMapper.totalCnt(pageDTO);
		pageDTO.setValue(totalCnt, pageDTO.getCntPerPage());
		
		return communityMapper.communitySelect(pageDTO);
	}
	
	// 글 상세보기
	@Override
	public CommunityDTO communityView(int communityNo) {
		
		return communityMapper.communityView(communityNo);
	}
	
	// 글 수정하기
	@Override
	public int communityModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception {
		
		String UPLOAD_DIR = "resources\\uploadFile";
		// 서버 물리적 경로 얻어오기
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		CommunityDTO communityDTO = new CommunityDTO();
		
		communityDTO.setCommunityNo(Integer.parseInt(mhRequest.getParameter("communityNo")));
		communityDTO.setCommunityTitle(mhRequest.getParameter("communityTitle"));
		communityDTO.setCommunityCategory(mhRequest.getParameter("communityCategory"));
		communityDTO.setCommunityContents(mhRequest.getParameter("communityContents"));
		communityDTO.setCommunityWriter(mhRequest.getParameter("communityWriter"));
		communityDTO.setCommunityPw(mhRequest.getParameter("communityPw"));
		
		MultipartFile file = mhRequest.getFile("communityImage");
		
		// 사진이 있어서 수정안했을 경우
		if(file == null) {
			communityDTO.setCommunityImage(mhRequest.getParameter("communityImage"));
			
		}else {
			if (file.getSize() != 0) {// !file.isEmpty()
				SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss-");
				Calendar calender = Calendar.getInstance();
				String sysFileName = format.format(calender.getTime());
				
				sysFileName += file.getOriginalFilename();
				communityDTO.setCommunityImage(sysFileName);
				
				File saveFile = new File(uploadPath + "\\" + sysFileName);
				
				try {
					file.transferTo(saveFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				communityDTO.setCommunityImage("non");
			}
		}
		
		return communityMapper.communityUpdate(communityDTO);
	}
	
	// 글 삭제하기
	@Override
	public int communityRemove(int communityNo) {
		
		return communityMapper.communityDelete(communityNo);
	}
	
	// 글 비밀번호 확인
	@Override
	public CommunityDTO communityPwChk(CommunityDTO communityDTO) {
		
		return communityMapper.communityPwChk(communityDTO);
	}
	
	// 전체 글 수
	@Override
	public int totalCnt(PageDTO pageDTO) {
		
		return communityMapper.totalCnt(pageDTO);
	}
}
