package dasi.web.dasi;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dasi.web.domain.PageDTO;
import dasi.web.domain.TrashDTO;
import dasi.web.service.TrashService;

@Controller
public class TrashController {
	
	@Autowired
	private TrashService trashService;
	
	
	// 쓰레기 리스트(admin)
	@RequestMapping(value="/adminTrash.do")
	public String ad_trashList(Model model, PageDTO pageDTO) {
		
		ArrayList<TrashDTO> trashList = trashService.trashList(pageDTO);
		
		model.addAttribute("trashList", trashList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "admin/ad_trashList";
	}
	
	// 쓰레기 리스트(member)
	@RequestMapping(value="/trashList.do")
	public String trashList(Model model, PageDTO pageDTO) {
		
		ArrayList<TrashDTO> trashList = trashService.trashList(pageDTO);
		
		model.addAttribute("trashList", trashList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "member/mb_trashList";
	}
	
	
	// 쓰레기 등록 페이지
	@RequestMapping(value="/trashRegister.do", method=RequestMethod.GET)
	public String registerForm() {
		
		return "admin/ad_trashRegister";
	}
	
	// 쓰레기 등록 처리
	@RequestMapping(value="/trashRegister.do", method=RequestMethod.POST)
	public String trashRegister(MultipartHttpServletRequest mhRequest, HttpServletRequest request) {
		
		trashService.trashRegister(mhRequest, request);
		
		return "redirect:/adminTrash.do";
	}
	
	// 쓰레기 상세보기
	@RequestMapping(value="/trashView.do", method=RequestMethod.GET)
	public String trashView(int trashNo, Model model, HttpServletRequest request, HttpServletResponse reponse) {
		
		TrashDTO trashDTO = trashService.trashView(trashNo, "click", request, reponse);
		model.addAttribute("trashDTO", trashDTO);
		
		return "member/mb_trashView";
	}

	// 쓰레기 수정 페이지
	@RequestMapping(value="/trashModify.do", method=RequestMethod.GET)
	public String modifyForm(int trashNo, Model model, HttpServletRequest request, HttpServletResponse reponse) {
		
		TrashDTO trashDTO = trashService.trashView(trashNo, "none", request, reponse);
		model.addAttribute("trashDTO", trashDTO);
		
		return "admin/ad_trashModify";
	}
	
	// 쓰레기 수정 처리
	@RequestMapping(value="/trashModify.do", method=RequestMethod.POST)
	public String trashModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request, RedirectAttributes reAttr) {
		
		trashService.trashModify(mhRequest, request);
		
		return "redirect:/adminTrash.do";
	}
	
	// 쓰레기 삭제
	@RequestMapping(value="/trashRemove.do")
	public String remove(int trashNo) {
		
		trashService.trashRemove(trashNo);
		
		return "redirect:/adminTrash.do";
	}
}
