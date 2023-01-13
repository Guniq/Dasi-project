package dasi.web.dasi;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dasi.web.domain.PageDTO;
import dasi.web.domain.ShopDTO;
import dasi.web.service.ShopService;

@Controller
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	
	// 제로웨이스트 샵 등록 페이지
	@RequestMapping(value="/shopRegister.do", method=RequestMethod.GET)
	public String registerForm() {
		
		return "admin/ad_shopRegister";
	}
	
	// 제로웨이스트 샵 등록 처리
	@RequestMapping(value="/shopRegister.do", method=RequestMethod.POST)
	public String shopRegister(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception{
		
		shopService.shopRegister(mhRequest, request);
		
		return "redirect:/adminShop.do";
	}
	
	// 제로웨이스트 샵 리스트(admin)
	@RequestMapping(value="/adminShop.do")
	public String ad_shopList(Model model, PageDTO pageDTO) {
		
		ArrayList<ShopDTO> shopList = shopService.shopList(pageDTO);
		
		model.addAttribute("shopList", shopList);
		
		return "admin/ad_shopList";
	}
	
	// 제로웨이스트 샵 리스트(member)
	@RequestMapping(value="/shopList.do")
	public String shopList(Model model, PageDTO pageDTO) {
		
		ArrayList<ShopDTO> shopList = shopService.shopList(pageDTO);
		
		model.addAttribute("shopList", shopList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "member/mb_shop";
	}
	
	// 제로웨이스트 샵 수정 페이지
	@RequestMapping(value="/shopModify.do", method=RequestMethod.GET)
	public String modifyForm(int shopNo, Model model) {
		
		ShopDTO shopDTO = shopService.shopView(shopNo);
		
		model.addAttribute("shopDTO", shopDTO);
		
		return "admin/ad_shopModify";
	}
	
	// 제로웨이스트 샵 수정 처리
	@RequestMapping(value="/shopModify.do", method=RequestMethod.POST)
	public String shopModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception {
		
		shopService.shopModify(mhRequest, request);
		
		return "redirect:/adminShop.do";
	}
	
	// 제로웨이스트 샵 삭제
	@RequestMapping(value="/shopRemove.do")
	public String shopRemove(int shopNo) {
		
		shopService.shopRemove(shopNo);
		
		return "redirect:/adminShop.do";
	}
}
