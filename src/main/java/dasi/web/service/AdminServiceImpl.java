package dasi.web.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dasi.web.domain.AdminDTO;
import dasi.web.domain.CommunityDTO;
import dasi.web.domain.MemberDTO;
import dasi.web.domain.PageDTO;
import dasi.web.mapper.AdminMapper;
import dasi.web.mapper.CommunityMapper;
import dasi.web.mapper.MemberMapper;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CommunityMapper communityMapper;
	
	
    // 관리자 로그인
	@Override
	public void adminLogin(AdminDTO adminDTO, HttpServletRequest request) {
		
		String adminName = adminMapper.adminLogin(adminDTO);
		
		HttpSession session = request.getSession();
		
		if(adminName != null) {
			session.setAttribute("adminId", adminDTO.getAdminId());
			session.setAttribute("adminName", adminName);
			
		}else {
			session.setAttribute("adminLoginF", "아이디나 비밀번호가 틀렸습니다. 다시 확인하세요!");
		}
	}
	
	// 회원리스트
	@Override
	public ArrayList<MemberDTO> memberList(PageDTO pageDTO) {
		
		int totalCnt = memberMapper.totalCnt(pageDTO);
		pageDTO.setValue(totalCnt, pageDTO.getCntPerPage());
		
		return memberMapper.memberSelect(pageDTO);
	}
	
	// 커뮤니티 리스트
	@Override
	public ArrayList<CommunityDTO> communityList(PageDTO pageDTO) {
		
		int totalCnt = adminMapper.totalCnt(pageDTO);
		pageDTO.setValue(totalCnt, pageDTO.getCntPerPage());
		
		return adminMapper.communitySelect(pageDTO); 
	}
	
	// 커뮤니티 공지사항 등록
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
	
	// 커뮤니티 공지사항 수정페이지
	@Override
	public CommunityDTO communityModifyForm(int communityNo) {
		
		return communityMapper.communityView(communityNo); 
	}
	
	// 커뮤니티 공지사항 수정처리
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
	
	// 커뮤니티 공지사항 삭제
	@Override
	public int communityRemove(int communityNo) {
		
		return communityMapper.communityDelete(communityNo);
	}
	
	// 전체 수
	@Override
	public int totalCnt(PageDTO pageDTO) {
		
		return memberMapper.totalCnt(pageDTO);
	}
}
