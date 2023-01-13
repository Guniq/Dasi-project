package dasi.web.dasi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dasi.web.domain.MemberDTO;
import dasi.web.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	
	// 회원가입 페이지
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.GET)
	public String joinForm() {
		
		return "member/memberJoin";
	}
	
	// 회원가입 처리
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.POST)
	public String join(MultipartHttpServletRequest mhRequest, RedirectAttributes reAtts, HttpServletRequest request) throws Exception  {
		
		memberService.memberJoin(mhRequest, request);
		
		return "redirect:/memberLogin.do";
	}
	
	//이메일 인증
	@ResponseBody
	@RequestMapping(value = "/memberEmail.do", method = RequestMethod.POST)
	public String joinEmail(String memberEmail) {		
		
		int checkNum = memberService.joinEmail(memberEmail);
		
		return Integer.toString(checkNum);
	}
	
	
	// 로그인 페이지
	@RequestMapping(value="/memberLogin.do", method=RequestMethod.GET)
	public String loginForm() {
		
		return "member/memberLogin";
	}
	
	// 로그인 처리
	@RequestMapping(value="/memberLogin.do", method=RequestMethod.POST)
	public String login(MemberDTO requestMemberDTO, HttpServletRequest request, HttpSession session) {
		
		MemberDTO memberDTO = memberService.memberLogin(requestMemberDTO,request, session);
		
		if(memberDTO != null) {
			if(pwEncoder.matches(requestMemberDTO.getMemberPw(), memberDTO.getMemberPw())){
				session.setAttribute("memberNo", memberDTO.getMemberNo());
				return "redirect:/"; 
				
		    }else {
		    	session.setAttribute("memberLoginF", "비밀번호가 틀렸습니다. 다시확인하세요!");
		    	return "member/memberLogin";
		    }
		}
		
		session.setAttribute("memberLoginF", "아이디가 틀렸습니다. 다시확인하세요!");
		return "member/memberLogin";
	}
	
	
	// 로그아웃 처리
	@RequestMapping(value="/memberLogout.do")
	public String memberLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:memberLogin.do";
	}
	
	// 마이페이지
	@RequestMapping(value="/mypage.do")
	public String myPage(int memberNo, Model model) {
		
		MemberDTO memberDTO = memberService.mypage(memberNo);
		model.addAttribute("memberDTO", memberDTO);
		
		return "member/mypage";
	}
	
	// 아이디 중복확인
	@ResponseBody
	@RequestMapping(value="/memberIdChk.do", method=RequestMethod.POST)
	public String memberIdChk(@RequestParam("memberId") String memberId) {
		
		String result = "N";
		
		int flag = memberService.memberIdChk(memberId);
		
		if(flag > 1) result = "Y";
		// 아이디가 있을 시 Y 없을 시 N
		
		return result;
	}
	
	// 닉네임 중복확인
	@ResponseBody
	@RequestMapping(value="/memberNameChk.do", method=RequestMethod.POST)
	public String memberNameChk(@RequestParam("memberName") String memberName) {
		
		String result = "N";
		
		int flag = memberService.memberNameChk(memberName);
		
		if(flag >= 1) result = "Y";
		
		return result;
	}
	
	// 아이디 찾기 페이지
	@RequestMapping(value="/memberFindId.do", method=RequestMethod.GET)
	public String idFindForm() {
		
		return "member/memberFindId";
	}
	
	// 아이디 찾기 처리
	@RequestMapping(value="/memberFindId.do", method=RequestMethod.POST)
	public String memberFindId(String memberName, Model model) {
		
		MemberDTO memberDTO = memberService.memberFindId(memberName);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("findIdF", "닉네임이 존재하지 않습니다. 다시 확인하세요!");
		
		return "member/memberFindId";
	}
	
	// 비밀번호 재설정 페이지
	@RequestMapping(value="/memberFindPw.do", method=RequestMethod.GET)
	public String pwFindForm() {
		
		return "member/memberFindPw";
	}
	
	// 비밀번호 재설정 처리
	@RequestMapping(value="/memberFindPw.do", method=RequestMethod.POST)
	public String memberFindPw(MemberDTO memberDTO, Model model, HttpSession session) {
		
		memberService.memberFindPw(memberDTO, model);
		session.invalidate();
		
		return "member/memberFindPw";
	}
	
	// 회원 수정 페이지
	@RequestMapping(value="/memberModify.do", method=RequestMethod.GET)
	public String modifyForm(int memberNo, Model model) {
		
		MemberDTO memberDTO = memberService.mypage(memberNo);
		model.addAttribute("memberDTO", memberDTO);

		return "member/memberModify";
	}
	
	// 회원 수정 처리
	@RequestMapping(value="/memberModify.do", method=RequestMethod.POST)
	public String memberModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request, int memberNo, RedirectAttributes reAtts) throws Exception {
		
		memberService.memberModify(mhRequest, request);
		reAtts.addAttribute("memberNo", memberNo);
		
		return "redirect:/mypage.do";
	}
	
	// 회원 삭제
	@RequestMapping(value="/memberRemove.do")
	public String memberRemove(int memberNo, HttpSession session) {
		
		memberService.memberRemove(memberNo);
		session.setAttribute("msg", "회원 삭제가 되었습니다!");
		
		return "redirect:/memberLogin.do";
	}
}
