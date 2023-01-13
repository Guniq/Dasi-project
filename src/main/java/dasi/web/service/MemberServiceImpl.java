package dasi.web.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dasi.web.domain.MemberDTO;
import dasi.web.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 회원 가입
	@Override
	public void memberJoin(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception {
		
		String UPLOAD_DIR = "resources\\uploadFile";
		// 서버 물리적 경로 얻어오기
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setMemberId(mhRequest.getParameter("memberId"));
		memberDTO.setMemberPw(mhRequest.getParameter("memberPw"));
		// 비밀번호 암호화
		String memberPw = pwEncoder.encode(memberDTO.getMemberPw());
		memberDTO.setMemberPw(memberPw);
		
		memberDTO.setMemberName(mhRequest.getParameter("memberName"));
		
		MultipartFile file = mhRequest.getFile("memberImage");
		
		if (file.getSize() != 0) {// !file.isEmpty()
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar calender = Calendar.getInstance();
			String sysFileName = format.format(calender.getTime());
			
			sysFileName += file.getOriginalFilename();
			memberDTO.setMemberImage(sysFileName);
			
			File saveFile = new File(uploadPath + "\\" + sysFileName);
			
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			memberDTO.setMemberImage("non");
		}
		
		memberMapper.memberInsert(memberDTO);
	}
	
    // 로그인
	@Override
	public MemberDTO memberLogin(MemberDTO memberDTO,HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
	    session.setAttribute("memberId", memberDTO.getMemberId());
		
		return memberMapper.memberLogin(memberDTO);
	}
	
	// 마이페이지
	@Override
	public MemberDTO mypage(int memberNo) {
		
		return memberMapper.mypage(memberNo);
	}
	
	// 아이디 중복확인
	@Override
	public int memberIdChk(String memberId) {
		
		int result = 0;
		result = memberMapper.memberIdChk(memberId);
		
		return result;
	}
	
	// 닉네임 중복확인
	@Override
	public int memberNameChk(String memberName) {
		
		int result = 0;
		result = memberMapper.memberNameChk(memberName);
		
		return result;
	}
	
	// 아이디 찾기
	@Override
	public MemberDTO memberFindId(String memberName) {
		
		return memberMapper.memberFindId(memberName);
	}
	
	// 비밀번호 재설정
	@Override
	public int memberFindPw(MemberDTO memberDTO, Model model) {
		
		// 비밀번호 암호화
		String memberPw = pwEncoder.encode(memberDTO.getMemberPw());
		memberDTO.setMemberPw(memberPw);
		
		int result = memberMapper.memberFindPw(memberDTO);
		if(result == 1) {
			model.addAttribute("memberDTO", memberDTO);
			model.addAttribute("findPw", "비밀번호가 재설정되었습니다!");
		}
		else {
			model.addAttribute("findPw", "아이디가 존재하지 않습니다. 다시 확인하세요!");
		}
		
		return result;
	}
	
	// 회원 수정
	@Override
	public int memberModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception {
		
		String UPLOAD_DIR = "resources\\uploadFile";
		// 서버 물리적 경로 얻어오기
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setMemberNo(Integer.parseInt(mhRequest.getParameter("memberNo")));
		
		MultipartFile file = mhRequest.getFile("memberImage");
		
		// 사진이 있어서 수정안했을 경우
		if(file == null) {
			memberDTO.setMemberImage(mhRequest.getParameter("memberImage"));
			
		}else {
			if (file.getSize() != 0) {// !file.isEmpty()
				SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss-");
				Calendar calender = Calendar.getInstance();
				String sysFileName = format.format(calender.getTime());
				
				sysFileName += file.getOriginalFilename();
				memberDTO.setMemberImage(sysFileName);
				
				File saveFile = new File(uploadPath + "\\" + sysFileName);
				
				try {
					file.transferTo(saveFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				memberDTO.setMemberImage("non");
			}
		}
		
		return memberMapper.memberUpdate(memberDTO);
	}
	
	// 회원 삭제
	@Override
	public int memberRemove(int memberNo) {
		
		return memberMapper.memberDelete(memberNo);
	}
	
	// 이메일 인증
	@Override
	public int joinEmail(String memberEmail) {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		/* 이메일 보내는 양식 */
        String setFrom = "biger0605@naver.com";
        String toMail = memberEmail;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "DASI를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
		System.out.println("~~~~~~~~~~~~인증번호: "+checkNum);
        
		return checkNum;
	}
	
}