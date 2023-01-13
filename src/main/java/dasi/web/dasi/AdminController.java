package dasi.web.dasi;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dasi.web.domain.AdminDTO;
import dasi.web.domain.CommunityDTO;
import dasi.web.domain.MemberDTO;
import dasi.web.domain.PageDTO;
import dasi.web.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 관리자 페이지
	@RequestMapping(value="/admin.do", method=RequestMethod.GET)
	public String adminPage(Model model, PageDTO pageDTO) {
		
		ArrayList<MemberDTO> memberList = adminService.memberList(pageDTO);
		model.addAttribute("memberList", memberList);
		
		return "admin/ad_index";
	}
	
	// 관리자 로그인 페이지
	@RequestMapping(value="/adminLogin.do", method=RequestMethod.GET)
	public String loginForm() {
		
		return "admin/ad_login";
	}
	
	// 관리자 로그인 처리
	@RequestMapping(value="/adminLogin.do", method=RequestMethod.POST)
	public String adminLogin(AdminDTO adminDTO, HttpServletRequest request) {
		
		adminService.adminLogin(adminDTO, request);
		
		return "redirect:/admin.do";
	}
	
	// 관리자 로그아웃 처리
	@RequestMapping("/adminLogout.do")
	public String adminLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:adminLogin.do";
	}
	
	// 회원리스트
	@RequestMapping(value="/adminMember.do")
	public String ad_memberList(PageDTO pageDTO, Model model) {
		
		ArrayList<MemberDTO> memberList = adminService.memberList(pageDTO);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "admin/ad_memberList";
	}
	
	// 커뮤니티 리스트
	@RequestMapping(value="/adminCommunity.do")
	public String ad_communityList(PageDTO pageDTO, Model model) {
		
		ArrayList<CommunityDTO> communityList = adminService.communityList(pageDTO);
		model.addAttribute("communityList", communityList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "admin/ad_communityList";
	}
	
	// 커뮤니티 공지사항 등록 페이지
	@RequestMapping(value="/adminCommunityWrite.do", method=RequestMethod.GET)
	public String ad_writeForm() {
		
		return "admin/ad_communityWrite";
	}
	
	// 커뮤니티 공지사항 등록 처리
	@RequestMapping(value="/adminCommunityWrite.do", method=RequestMethod.POST)
	public String ad_communityWrite(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception {
		
		adminService.communityWrite(mhRequest, request);
		
		return "redirect:/adminCommunity.do";
	}
	
	// 커뮤니티 공지사항 수정 페이지
	@RequestMapping(value="/adminCommunityModify.do", method=RequestMethod.GET)
	public String ad_modifyForm(int communityNo, Model model) {
		
		CommunityDTO communityDTO = adminService.communityModifyForm(communityNo);
		model.addAttribute("communityDTO", communityDTO);
		
		return "admin/ad_communityModify";
	}
	
	// 커뮤니티 공지사항 수정 처리
	@RequestMapping(value="/adminCommunityModify.do", method=RequestMethod.POST)
	public String ad_communityModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception {
		
		adminService.communityModify(mhRequest, request);
		
		return "redirect:/adminCommunity.do";
	}
	
	// 커뮤니티 공지사항 삭제
	@RequestMapping(value="/adminCommunityRemove.do")
	public String ad_communityRemove(int communityNo) {
		
		adminService.communityRemove(communityNo);
		
		return "redirect:/adminCommunity.do";
	}
}
