package dasi.web.dasi;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dasi.web.domain.CommunityDTO;
import dasi.web.domain.PageDTO;
import dasi.web.domain.ReplyDTO;
import dasi.web.service.CommunityService;
import dasi.web.service.ReplyService;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private ReplyService replyService;
	
	// 커뮤니티 페이지 + 리스트
	@RequestMapping(value="/community.do")
	public String ad_community(Model model, PageDTO pageDTO) {
		
		ArrayList<CommunityDTO> communityList = communityService.communityList(pageDTO);
		
		model.addAttribute("communityList", communityList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "member/community";
	}
	
	// 커뮤니티 글쓰기 페이지
	@RequestMapping(value="/communityWrite.do", method=RequestMethod.GET)
	public String writeForm() {
		
		return "member/community_write";
	}
	
	// 커뮤니티 글쓰기 처리
	@RequestMapping(value="/communityWrite.do", method=RequestMethod.POST)
	public String communityWrite(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception {
		
		communityService.communityWrite(mhRequest, request);
		
		return "redirect:/community.do";
	}
	
	// 커뮤니티 글 상세보기 + 댓글 리스트
	@RequestMapping(value="/communityView.do", method=RequestMethod.GET)
	public String communityView(int communityNo, Model model) {
		
		CommunityDTO communityDTO = communityService.communityView(communityNo);
		model.addAttribute("communityDTO", communityDTO);
		
		// 댓글 서비스
		ArrayList<ReplyDTO> replyList = replyService.replyList(communityNo);
		int replyCnt = replyService.replyCount(communityNo);
		
		model.addAttribute("replyList", replyList);
		model.addAttribute("replyCnt", replyCnt);
		
		
		return "member/community_view";
	}

	// 커뮤니티 글 수정 페이지
	@RequestMapping(value="/communityModify.do", method=RequestMethod.GET)
	public String modifyForm(int communityNo, Model model) {
		
		CommunityDTO communityDTO = communityService.communityView(communityNo);
		model.addAttribute("communityDTO", communityDTO);
		
		return "member/community_modify";
	}
	
	// 커뮤니티 글 수정 처리
	@RequestMapping(value="/communityModify.do", method=RequestMethod.POST)
	public String communityModify(MultipartHttpServletRequest mhRequest, int communityNo, RedirectAttributes reAtts, HttpServletRequest request) throws Exception {
		
		communityService.communityModify(mhRequest, request);
		reAtts.addAttribute("communityNo", communityNo);
		
		return "redirect:/communityView.do";
	}
	
	
	// 커뮤니티 글 삭제
	@RequestMapping(value="/communityRemove.do")
	public String communityRemove(int communityNo) {
		
		communityService.communityRemove(communityNo);
		
		return "redirect:/community.do";
	}
	
	// 커뮤니티 글 비밀번호 확인
	@ResponseBody
	@RequestMapping(value="/communityPwChk.do", method=RequestMethod.POST)
	public String communityPwChk(CommunityDTO requestCommunityDTO) {

		String result = "N";
		
		CommunityDTO communityDTO = communityService.communityPwChk(requestCommunityDTO);
		if(communityDTO != null) result ="Y";
		
		return result;
	}
}
