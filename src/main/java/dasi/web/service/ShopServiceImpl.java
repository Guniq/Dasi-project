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

import dasi.web.domain.PageDTO;
import dasi.web.domain.ShopDTO;
import dasi.web.mapper.ShopMapper;

@Service
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	private ShopMapper shopMapper;
	
	// 제로웨이스트 샵 등록
	@Override
	public void shopRegister(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception {
		
		String UPLOAD_DIR = "resources\\uploadFile";
		// 서버 물리적 경로 얻어오기
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		ShopDTO shopDTO = new ShopDTO();
		
		shopDTO.setShopName(mhRequest.getParameter("shopName"));
		shopDTO.setShopLink(mhRequest.getParameter("shopLink"));
		
		MultipartFile file = mhRequest.getFile("shopImage");
		
		if (file.getSize() != 0) {// !file.isEmpty()
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss-");
			Calendar calender = Calendar.getInstance();
			String sysFileName = format.format(calender.getTime());
			
			sysFileName += file.getOriginalFilename();
			shopDTO.setShopImage(sysFileName);
			
			File saveFile = new File(uploadPath + "\\" + sysFileName);
			
			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			shopDTO.setShopImage("non");
		}
		
		shopMapper.shopInsert(shopDTO);
	}
	
	// 제로웨이스트 샵 리스트
	@Override
	public ArrayList<ShopDTO> shopList(PageDTO pageDTO) {
		
		int totalCnt = shopMapper.totalCnt(pageDTO);
		pageDTO.setValue(totalCnt, pageDTO.getCntPerPage());
		
		return shopMapper.shopSelect(pageDTO);
	}
	
	// 제로웨이스트 샵 상세보기
	@Override
	public ShopDTO shopView(int shopNo) {
		
		return shopMapper.shopView(shopNo);
	}
	
	// 제로웨이스트 샵 수정하기
	@Override
	public int shopModify(MultipartHttpServletRequest mhRequest, HttpServletRequest request) throws Exception{
		
		String UPLOAD_DIR = "resources\\uploadFile";
		// 서버 물리적 경로 얻어오기
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		ShopDTO shopDTO = new ShopDTO();
		
		shopDTO.setShopNo(Integer.parseInt(mhRequest.getParameter("shopNo")));
		shopDTO.setShopName(mhRequest.getParameter("shopName"));
		shopDTO.setShopLink(mhRequest.getParameter("shopLink"));
		
		MultipartFile file = mhRequest.getFile("shopImage");
		
		// 사진이 있어서 수정안했을 경우
		if(file == null) {
			shopDTO.setShopImage(mhRequest.getParameter("shopImage"));
			
		}else {
			if (file.getSize() != 0) {// !file.isEmpty()
				SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss-");
				Calendar calender = Calendar.getInstance();
				String sysFileName = format.format(calender.getTime());
				
				sysFileName += file.getOriginalFilename();
				shopDTO.setShopImage(sysFileName);
				
				File saveFile = new File(uploadPath + "\\" + sysFileName);
				
				try {
					file.transferTo(saveFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				shopDTO.setShopImage("non");
			}
		}
		
		return shopMapper.shopUpdate(shopDTO);
	}
	
	// 제로웨이스트 샵 삭제하기
	@Override
	public int shopRemove(int shopNo) {
		
		return shopMapper.shopDelete(shopNo);
	}
	
	// 전체 글 수
	@Override
	public int totalCnt(PageDTO pageDTO) {
		
		return shopMapper.totalCnt(pageDTO);
	}
}
