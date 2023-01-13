package dasi.web.dasi;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dasi.web.domain.ReplyDTO;
import dasi.web.service.ReplyService;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	
	// 커뮤니티 댓글쓰기 처리
	@RequestMapping(value="/replyWrite.do", method=RequestMethod.POST)
	public String replyWrite(int communityNo
					, ReplyDTO replyDTO
					, RedirectAttributes reAttr) {
		
		replyService.replyWrite(replyDTO);
		
		reAttr.addAttribute("communityNo", communityNo);
		
		return "redirect:/communityView.do";
	}
	
	// 커뮤니티 댓글 삭제하기
	@RequestMapping(value="/replyRemove.do")
	public String replyRemove(int replyNo
						, RedirectAttributes reAttr
						, int communityNo) {
		
		replyService.replyRemove(replyNo);

		reAttr.addAttribute("communityNo", communityNo);
		
		return "redirect:/communityView.do";
	}
	
}
