package com.icia.project.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.icia.project.dao.AdminDAO;
import com.icia.project.dto.BeautyDTO;
import com.icia.project.dto.CouponDTO;
import com.icia.project.dto.EducationDTO;
import com.icia.project.dto.EventDTO;
import com.icia.project.dto.GoodsDTO;
import com.icia.project.dto.HotelDTO;
import com.icia.project.dto.MedicalDTO;
import com.icia.project.dto.MemberDTO;
import com.icia.project.dto.PageDTO;
import com.icia.project.dto.ReportDTO;
import com.icia.project.dto.ReviewDTO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adminDAO = new AdminDAO();
	private ModelAndView mav = new ModelAndView();
	File file = new File("");
	SimpleDateFormat date = new SimpleDateFormat ( "yyMMdd_HHmmss");
	Date time = new Date();
	
// 게시판 관리
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	// 호텔 목록
	public ModelAndView hotelManagement() {
		List<HotelDTO> hotelResult = adminDAO.hotelManagement();
		mav.addObject("management", hotelResult);
		mav.setViewName("BoardManagement");
		return mav;
	}
	// 호텔 방 작성
	public ModelAndView hotelBoardWrite(HotelDTO hotel, List<MultipartFile> fileList) throws IllegalStateException, IOException {
		
		//파일 저장 경로
        String path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/hotelFile/"+date.format(time)+"ㅡ";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            String safeFile = path  + originFileName;
            try {
                mf.transferTo(new File(safeFile));
				  if(fileList.get(0).getOriginalFilename().equals(originFileName)) {
					  hotel.setHotelRoomImage1(date.format(time)+"ㅡ"+originFileName);
				  } else if(fileList.get(1).getOriginalFilename().equals(originFileName)) {
					  hotel.setHotelRoomImage2(date.format(time)+"ㅡ"+originFileName);
				  } else if(fileList.get(2).getOriginalFilename().equals(originFileName)) {
					  hotel.setHotelRoomImage3(date.format(time)+"ㅡ"+originFileName);
				  } else if(fileList.get(3).getOriginalFilename().equals(originFileName)) {
					  hotel.setHotelRoomImage4(date.format(time)+"ㅡ"+originFileName);
				  } else if(fileList.get(4).getOriginalFilename().equals(originFileName)) {
						  hotel.setHotelRoomImage5(date.format(time)+"ㅡ"+originFileName);
				  } 
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        
		adminDAO.hotelBoardWrite(hotel);
		mav.setViewName("redirect:/hotelManagement");
		return mav;
	}
	// 호텔 방 상세보기
	public ModelAndView hotelBoardView(String hotelCode) {
		HotelDTO hotelResult = adminDAO.hotelBoardView(hotelCode);
		mav.addObject("hotelView", hotelResult);
		mav.setViewName("AdminHotelView");
		return mav;
	}
	// 호텔 방 수정 전 정보 불러오기
	public ModelAndView hotelBoardModify(String hotelCode) {
		HotelDTO hotelResult = adminDAO.hotelBoardView(hotelCode);
		mav.addObject("hotelView", hotelResult);
		mav.setViewName("AdminHotelModifyForm");
		return mav;
	}
	// 호텔 방 수정 처리
	public ModelAndView hotelBoardModifyProcess(HotelDTO hotel, List<MultipartFile> fileList) throws IllegalStateException, IOException {
		if(hotel.getHotelRoomImageFile().isEmpty()) { 
			adminDAO.hotelBoardModifyProcess(hotel);
		} else{
			// 게시글 수정 전 서버에 저장된 사진 삭제
				HotelDTO hotelResult=adminDAO.hotelBoardView(hotel.getHotelCode());
				String deletePath = "";
				deletePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/hotelFile/"+hotelResult.getHotelRoomImage1(); // 삭제할 파일의 경로
				file = new File(deletePath);
				if(file.exists() == true){
					file.delete();
				}
				deletePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/hotelFile/"+hotelResult.getHotelRoomImage2(); // 삭제할 파일의 경로
				file = new File(deletePath);
				if(file.exists() == true){
					file.delete();
				}
				deletePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/hotelFile/"+hotelResult.getHotelRoomImage3(); // 삭제할 파일의 경로
				file = new File(deletePath);
				if(file.exists() == true){
					file.delete();
				}
				deletePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/hotelFile/"+hotelResult.getHotelRoomImage4(); // 삭제할 파일의 경로
				file = new File(deletePath);
				if(file.exists() == true){
					file.delete();
				}
				deletePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/hotelFile/"+hotelResult.getHotelRoomImage5(); // 삭제할 파일의 경로
				file = new File(deletePath);
				if(file.exists() == true){
					file.delete();
				}
			//파일 저장 경로
	        String path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/hotelFile/"+date.format(time)+"ㅡ";
	
	        for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            String safeFile = path  + originFileName;
	            try {
	                mf.transferTo(new File(safeFile));
					  if(fileList.get(0).getOriginalFilename().equals(originFileName)) {
						  hotel.setHotelRoomImage1(date.format(time)+"ㅡ"+originFileName);
					  } else if(fileList.get(1).getOriginalFilename().equals(originFileName)) {
						  hotel.setHotelRoomImage2(date.format(time)+"ㅡ"+originFileName);
					  } else if(fileList.get(2).getOriginalFilename().equals(originFileName)) {
						  hotel.setHotelRoomImage3(date.format(time)+"ㅡ"+originFileName);
					  } else if(fileList.get(3).getOriginalFilename().equals(originFileName)) {
						  hotel.setHotelRoomImage4(date.format(time)+"ㅡ"+originFileName);
					  } else if(fileList.get(4).getOriginalFilename().equals(originFileName)) {
							  hotel.setHotelRoomImage5(date.format(time)+"ㅡ"+originFileName);
					  } 
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
	        adminDAO.hotelBoardModifyProcess(hotel);
		}
		
		mav.setViewName("redirect:/hotelBoardView?hotelCode="+hotel.getHotelCode());
		return mav;
	}
	// 호텔 방 삭제
	public ModelAndView hotelBoardDelete(String hotelCode) {
		// 게시글 삭제 전 서버에 저장된 사진 삭제
		HotelDTO hotel=adminDAO.hotelBoardView(hotelCode);
		String path = "";
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/hotelFile/"+hotel.getHotelRoomImage1(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/hotelFile/"+hotel.getHotelRoomImage2(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/hotelFile/"+hotel.getHotelRoomImage3(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/hotelFile/"+hotel.getHotelRoomImage4(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/hotelFile/"+hotel.getHotelRoomImage5(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		
		// 실제로 DB에 저장된 게시글 삭제
		adminDAO.hotelBoardDelete(hotelCode);
		mav.setViewName("redirect:/hotelManagement");
		return mav;
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	// 미용사 목록
	public ModelAndView beautyManagement() {
		List<BeautyDTO> beautyResult = adminDAO.beautyManagement();
		mav.addObject("management", beautyResult);
		mav.setViewName("BoardManagement");
		return mav;
	}
	// 미용사 작성
	public ModelAndView beautyBoardWrite(BeautyDTO beauty) throws IllegalStateException, IOException {
		MultipartFile beautyFile = beauty.getDesignerImageFile();
		
		String fileName = date.format(time)+"ㅡ"+beautyFile.getOriginalFilename();
		
		// 파일 저장 경로
		String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/beautyFile/"+fileName;
		
		if(!beautyFile.isEmpty()) {
			beautyFile.transferTo(new File(savePath));
		}
		beauty.setDesignerImage(fileName);
		
		adminDAO.beautyBoardWrite(beauty);
		mav.setViewName("redirect:/beautyManagement");
		return mav;
	}
	// 미용사 상세보기
	public ModelAndView beautyBoardView(String designerCode) {
		BeautyDTO beautyResult = adminDAO.beautyBoardView(designerCode);
		mav.addObject("beautyView", beautyResult);
		mav.setViewName("AdminBeautyView");
		return mav;
	}
	// 미용사 수정 전 정보 가져오기
	public ModelAndView beautyBoardModify(String designerCode) {
		BeautyDTO beautyResult = adminDAO.beautyBoardView(designerCode);
		mav.addObject("beautyView", beautyResult);
		mav.setViewName("AdminBeautyModifyForm");
		return mav;
	}
	// 미용사 수정 처리
	public ModelAndView beautyBoardModifyProcess(BeautyDTO beauty) throws IllegalStateException, IOException {
		if(!beauty.getDesignerImageFile().isEmpty()) {
			MultipartFile beautyFile = beauty.getDesignerImageFile();
			
			String fileName = date.format(time)+"ㅡ"+beautyFile.getOriginalFilename();
			
			// 파일 저장 경로
			String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/beautyFile/"+fileName;
			
			if(!beautyFile.isEmpty()) {
				beautyFile.transferTo(new File(savePath));
			}
			beauty.setDesignerImage(fileName);
		}
		
		adminDAO.beautyBoardModifyProcess(beauty);

		mav.setViewName("redirect:/beautyBoardView?designerCode="+beauty.getDesignerCode());
		return mav;
	}
	// 미용사 삭제
	public ModelAndView beautyBoardDelete(String designerCode) {
		// 게시글 삭제 전 서버에 저장된 사진 삭제
		BeautyDTO beauty=adminDAO.beautyBoardView(designerCode);
		String path = "";
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/beautyFile/"+beauty.getDesignerImage(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		
		// 실제 DB에 저장된 게시글 삭제
		adminDAO.beautyBoardDelete(designerCode);
		mav.setViewName("redirect:/beautyManagement");
		return mav;
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//의사 목록
	public ModelAndView medicalManagement() {
		List<MedicalDTO> medicalResult = adminDAO.medicalManagement();
		mav.addObject("management", medicalResult);
		mav.setViewName("BoardManagement");
		return mav;
	}
	//의사 작성
	public ModelAndView medicalBoardWrite(MedicalDTO medical) throws IllegalStateException, IOException {
		
			MultipartFile medicalFile = medical.getDoctorImageFile();
			
			String fileName = date.format(time)+"ㅡ"+medicalFile.getOriginalFilename();
			
			// 파일 저장 경로
			String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/medicalFile/"+fileName;
			
			if(!medicalFile.isEmpty()) {
				medicalFile.transferTo(new File(savePath));
			}
			medical.setDoctorImage(fileName);

		adminDAO.medicalBoardWrite(medical);
		mav.setViewName("redirect:/medicalManagement");
		return mav;
	}
	//의사 상세보기
	public ModelAndView medicalBoardView(String doctorCode) {
		MedicalDTO medicalResult = adminDAO.medicalBoardView(doctorCode);
		mav.addObject("medicalView", medicalResult);
		mav.setViewName("AdminMedicalView");
		return mav;
	}
	//의사 수정 전 정보 가져오기
	public ModelAndView medicalBoardModify(String doctorCode) {
		MedicalDTO medicalResult = adminDAO.medicalBoardView(doctorCode);
		mav.addObject("medicalView", medicalResult);
		mav.setViewName("AdminMedicalModifyForm");
		return mav;
	}
	//의사 수정 처리
	public ModelAndView medicalBoardModifyProcess(MedicalDTO medical) throws IllegalStateException, IOException {
		if(!medical.getDoctorImageFile().isEmpty()) {
			MultipartFile medicalFile = medical.getDoctorImageFile();
			
			String fileName = date.format(time)+"ㅡ"+medicalFile.getOriginalFilename();
			
			// 파일 저장 경로
			String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/medicalFile/"+fileName;
			
			if(!medicalFile.isEmpty()) {
				medicalFile.transferTo(new File(savePath));
			}
			medical.setDoctorImage(fileName);
		}
		adminDAO.medicalBoardModifyProcess(medical);
		mav.setViewName("redirect:/medicalBoardView?doctorCode="+medical.getDoctorCode());
		return mav;
	}
	//의사 삭제
	public ModelAndView medicalBoardDelete(String doctorCode) {
		// 게시글 삭제 전 서버에 저장된 사진 삭제
		MedicalDTO medical=adminDAO.medicalBoardView(doctorCode);
		String path = "";
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/beautyFile/"+medical.getDoctorImage(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		// 실제 DB에 저장된 게시글 삭제
		adminDAO.medicalBoardDelete(doctorCode);
		mav.setViewName("redirect:/medicalManagement");
		return mav;
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//교육 목록
	public ModelAndView educationManagement(int page, String eduAnimalKind) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("eduAnimalKind", eduAnimalKind);
		// 페이징처리에 사용될 글 개수 세기	
		int listCount = adminDAO.educationCount(eduAnimalKind);
		mav.addObject("eduAnimalKind",eduAnimalKind);
		 
		int startRow = (page - 1) * 15 + 1;
		int endRow = page * 15;
		int maxPage = (int) (Math.ceil((double) listCount / 15));	// ceil : 값보다 큰 정수를 찾는 것.
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		paging.setEndRow(endRow);
		paging.setStartRow(startRow);
		paging.setEndPage(endPage);
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setMaxPage(maxPage);
						
		mav.addObject("paging", paging);
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		//글 목록 불러오기
		List<EducationDTO> educationResult = educationResult = adminDAO.educationManagement(map);
		
		mav.addObject("management", educationResult);
		mav.setViewName("BoardManagement");
		return mav;
	}
	//교육 작성
	public ModelAndView educationBoardWrite(EducationDTO education) throws IllegalStateException, IOException {
		MultipartFile educationFile = education.getEduImageFile();
		
		String fileName = date.format(time)+"ㅡ"+educationFile.getOriginalFilename();
		
		// 파일 저장 경로
		String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/educationFile/"+fileName;
		
		if(!educationFile.isEmpty()) {
			educationFile.transferTo(new File(savePath));
		}
		education.setEduImage(fileName);
		
		//교육 할 수 있는 동물 종류
		String animalKind="";
			for(int i=0; i<education.getEduAnimalKinds().length; i++) {
				animalKind += education.getEduAnimalKinds()[i];
				for(int j=0; j<education.getEduAnimalKinds().length-1; j++) {
					animalKind += ", ";
				}
			}
		education.setEduAnimalKind(animalKind);
		
		
		adminDAO.educationBoardWrite(education);
		mav.setViewName("redirect:/educationManagement");
		return mav;
	}
	//교육 상세보기
	public ModelAndView educationBoardView(int eduNum) {
		EducationDTO educationResult = adminDAO.educationBoardView(eduNum);
		mav.addObject("educationView", educationResult);
		mav.setViewName("AdminEducationView");
		return mav;
	}
	//교육 수정 전 정보 가져오기
	public ModelAndView educationBoardModify(int eduNum) {
		EducationDTO educationResult = adminDAO.educationBoardView(eduNum);
		educationResult.setEduAnimalKinds(educationResult.getEduAnimalKind().split(", "));
		mav.addObject("educationView", educationResult);
		mav.setViewName("AdminEducationModifyForm");
		return mav;
	}
	//교육 수정 처리
	public ModelAndView educationBoardModifyProcess(EducationDTO education) throws IllegalStateException, IOException {
		if(!education.getEduImageFile().isEmpty()) {
			MultipartFile educationFile = education.getEduImageFile();
			String fileName = date.format(time)+"ㅡ"+educationFile.getOriginalFilename();
			
			// 파일 저장 경로
			String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/educationFile/"+fileName;
			
			if(!educationFile.isEmpty()) {
				educationFile.transferTo(new File(savePath));
			}
			education.setEduImage(fileName);
		}

		//교육 할 수 있는 동물 종류
		String animalKind="";
			for(int i=0; i<education.getEduAnimalKinds().length; i++) {
				animalKind += education.getEduAnimalKinds()[i];
				for(int j=0; j<education.getEduAnimalKinds().length-1; j++) {
					animalKind += ", ";
				}
			}
		education.setEduAnimalKind(animalKind);
		
		adminDAO.educationBoardModifyProcess(education);
		
		mav.setViewName("redirect:/educationBoardView?eduNum="+education.getEduNum());
		return mav;
	}
	//교육 삭제
	public ModelAndView educationBoardDelete(int eduNum) {
		// 게시글 삭제 전 서버에 저장된 사진 삭제
		EducationDTO education=adminDAO.educationBoardView(eduNum);
		String path = "";
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/beautyFile/"+education.getEduImage(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		// 실제 DB에 저장된 게시글 삭제		
		adminDAO.educationBoardDelete(eduNum);
		mav.setViewName("redirect:/educationManagement");
		return mav;
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//용품 목록
	public ModelAndView goodsManagement(int page) {
		// 페이징처리에 사용될 글 개수 세기		
		int listCount = adminDAO.goodsListCount(); 
		int startRow = (page - 1) * 15 + 1;
		int endRow = page * 15;
		int maxPage = (int) (Math.ceil((double) listCount / 15));	// ceil : 값보다 큰 정수를 찾는 것.
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		paging.setEndRow(endRow);
		paging.setStartRow(startRow);
		paging.setEndPage(endPage);
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setMaxPage(maxPage);
				
		mav.addObject("paging", paging);
		
		List<GoodsDTO> goodsResult = adminDAO.goodsManagement(paging);
		mav.addObject("management", goodsResult);
		mav.setViewName("BoardManagement");
		return mav;
	}
	//용품 글 작성
	public ModelAndView goodsBoardWrite(GoodsDTO goods, List<MultipartFile> fileList) throws IllegalStateException, IOException {
		//파일 저장 경로
        String path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+date.format(time)+"ㅡ";
        
        
        MultipartFile goodsContents = goods.getGoodsContentsFile();
		String fileName = date.format(time)+"ㅡ"+goodsContents.getOriginalFilename();
		// 파일 저장 경로
		String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+fileName;
		
		if(!goodsContents.isEmpty()) {
			goodsContents.transferTo(new File(savePath));
			goods.setGoodsContents(fileName);
		}
		

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            String safeFile = path  + originFileName;
            try {
                mf.transferTo(new File(safeFile));
				  if(fileList.get(0).getOriginalFilename().equals(originFileName)) {
					  goods.setGoodsImage1(date.format(time)+"ㅡ"+originFileName);
				  } else if(fileList.get(1).getOriginalFilename().equals(originFileName)) {
					  goods.setGoodsImage2(date.format(time)+"ㅡ"+originFileName);
				  } else if(fileList.get(2).getOriginalFilename().equals(originFileName)) {
					  goods.setGoodsImage3(date.format(time)+"ㅡ"+originFileName);
				  } else if(fileList.get(3).getOriginalFilename().equals(originFileName)) {
					  goods.setGoodsImage4(date.format(time)+"ㅡ"+originFileName);
				  } else if(fileList.get(4).getOriginalFilename().equals(originFileName)) {
					  goods.setGoodsImage5(date.format(time)+"ㅡ"+originFileName);
				  } 
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
		
		// 용품 사용가능한 동물 종류 합치기
		String[] arrayAnimalKind = goods.getGoodsAnimalKinds();
		String animalKind="";
		for(int i=0; i<arrayAnimalKind.length; i++) {
			animalKind+=arrayAnimalKind[i];
			if(i<arrayAnimalKind.length-1) {
				animalKind+=", ";
			}
		}
		goods.setGoodsAnimalKind(animalKind);
		adminDAO.goodsBoardWrite(goods);
		mav.setViewName("redirect:/goodsManagement");
		return mav;
	}
	//용품 상세보기
	public ModelAndView goodsBoardView(int goodsNum) {
		GoodsDTO goodsResult = adminDAO.goodsBoardView(goodsNum);
		mav.addObject("goodsView", goodsResult);
		mav.setViewName("AdminGoodsView");
		return mav;
	}
	// 용품 수정 전 정보 가져오기
	public ModelAndView goodsBoardModify(int goodsNum) {
		GoodsDTO goodsResult = adminDAO.goodsBoardView(goodsNum);
		
		goodsResult.setGoodsAnimalKinds(goodsResult.getGoodsAnimalKind().split(", "));
		
		mav.addObject("goodsView", goodsResult);
		mav.setViewName("AdminGoodsModifyForm");
		return mav;
	}
	//용품 수정 처리
	public ModelAndView goodsBoardModifyProcess(GoodsDTO goods, List<MultipartFile> fileList) throws IllegalStateException, IOException {
		GoodsDTO goodsResult=adminDAO.goodsBoardView(goods.getGoodsNum());
	
		String deletePath = "";
		if(!goods.getGoodsContentsFile().isEmpty()) {
			deletePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+goodsResult.getGoodsContents(); // 삭제할 파일의 경로
			file = new File(deletePath);
			if(file.exists() == true){
				file.delete();
			}
			MultipartFile goodsContents = goods.getGoodsContentsFile();
			String fileName = date.format(time)+"ㅡ"+goodsContents.getOriginalFilename();
			// 파일 저장 경로
			String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+fileName;
			
			if(!goodsContents.isEmpty()) {
				goodsContents.transferTo(new File(savePath));
				goods.setGoodsContents(fileName);
			}
		} else {
			goods.setGoodsContents(goodsResult.getGoodsContents());
		}
		// 게시글 수정 전 서버에 저장된 사진 삭제
		if(!goods.getGoodsImageFile().isEmpty()) {
				deletePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+goodsResult.getGoodsImage1(); // 삭제할 파일의 경로
				file = new File(deletePath);
				if(file.exists() == true){
					file.delete();
				}
				deletePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+goodsResult.getGoodsImage2(); // 삭제할 파일의 경로
				file = new File(deletePath);
				if(file.exists() == true){
					file.delete();
				}
				deletePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+goodsResult.getGoodsImage3(); // 삭제할 파일의 경로
				file = new File(deletePath);
				if(file.exists() == true){
					file.delete();
				}
				deletePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+goodsResult.getGoodsImage4(); // 삭제할 파일의 경로
				file = new File(deletePath);
				if(file.exists() == true){
					file.delete();
				}
				deletePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+goodsResult.getGoodsImage5(); // 삭제할 파일의 경로
				file = new File(deletePath);
				if(file.exists() == true){
					file.delete();
				}
		
			//파일 저장 경로
			String path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+date.format(time)+"ㅡ";
			for (MultipartFile mf : fileList) {
				 String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				 String safeFile = path  + originFileName;
				 try {
					 	mf.transferTo(new File(safeFile));
					 	if(fileList.get(0).getOriginalFilename().equals(originFileName)) {
					 		goods.setGoodsImage1(date.format(time)+"ㅡ"+originFileName);
						} else if(fileList.get(1).getOriginalFilename().equals(originFileName)) {
							goods.setGoodsImage2(date.format(time)+"ㅡ"+originFileName);
						} else if(fileList.get(2).getOriginalFilename().equals(originFileName)) {
							goods.setGoodsImage3(date.format(time)+"ㅡ"+originFileName);
						} else if(fileList.get(3).getOriginalFilename().equals(originFileName)) {
							goods.setGoodsImage4(date.format(time)+"ㅡ"+originFileName);
						} else if(fileList.get(4).getOriginalFilename().equals(originFileName)) {
							goods.setGoodsImage5(date.format(time)+"ㅡ"+originFileName);
						} 
				     } catch (IllegalStateException e) {
				           e.printStackTrace();
				       } catch (IOException e) {
				            e.printStackTrace();
				        }
				     }
		}else {
			goods.setGoodsImage1(goodsResult.getGoodsImage1());
			goods.setGoodsImage2(goodsResult.getGoodsImage2());
			goods.setGoodsImage3(goodsResult.getGoodsImage3());
			goods.setGoodsImage4(goodsResult.getGoodsImage4());
			goods.setGoodsImage5(goodsResult.getGoodsImage5());
		}
						// 용품 사용가능한 동물 종류 합치기
						String[] arrayAnimalKind = goods.getGoodsAnimalKinds();
						String animalKind="";
						for(int i=0; i<arrayAnimalKind.length; i++) {
							animalKind+=arrayAnimalKind[i];
							if(i<arrayAnimalKind.length-1) {
								animalKind+=", ";
							}
						}
		goods.setGoodsAnimalKind(animalKind);
		adminDAO.goodsBoardModifyProcess(goods);
		
		mav.setViewName("redirect:/goodsBoardView?goodsNum="+goods.getGoodsNum());
		return mav;
	}
	//용품 삭제
	public ModelAndView goodsBoardDelete(int goodsNum) {
		// 게시글 삭제 전 서버에 저장된 사진 삭제
		GoodsDTO goods=adminDAO.goodsBoardView(goodsNum);
		String path = "";
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+goods.getGoodsImage1(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+goods.getGoodsImage2(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+goods.getGoodsImage3(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+goods.getGoodsImage4(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/goodsFile/"+goods.getGoodsImage5(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		
		
						
		// DB에 저장된 게시글 삭제
		adminDAO.goodsBoardDelete(goodsNum);
						
		mav.setViewName("redirect:/goodsManagement");
		return mav;
	}
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	//이벤트 목록
	public ModelAndView eventManagement() {
		List<EventDTO> eventResult = adminDAO.eventManagement();
		mav.addObject("management", eventResult);
		mav.setViewName("BoardManagement");
		return mav;
	}
	// 이벤트 작성
	public ModelAndView eventBoardWrite(EventDTO event) throws IllegalStateException, IOException {
		MultipartFile eventFile = event.getEventImageFile();
		MultipartFile eventTitleFile = event.getEventTitleImageFile();
		
		String fileName = date.format(time)+"ㅡ"+eventFile.getOriginalFilename();
		String titleFileName = date.format(time)+"ㅡ"+eventTitleFile.getOriginalFilename();
		
		// 파일 저장 경로
		String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/eventFile/"+fileName;
		String saveTitlePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/eventFile/"+titleFileName;
		
		if(!eventFile.isEmpty()) {
			eventFile.transferTo(new File(savePath));
		}
		if(!eventTitleFile.isEmpty()) {
			eventTitleFile.transferTo(new File(saveTitlePath));
		}
		event.setEventImage(fileName);
		event.setEventTitleImage(titleFileName);
		
		adminDAO.eventBoardWrite(event);
		mav.setViewName("redirect:/eventManagement");
		return mav;
	}
	//이벤트 상세보기
	public ModelAndView eventBoardView(int eventNum) {
		EventDTO eventResult = adminDAO.eventBoardView(eventNum);
		CouponDTO couponResult = adminDAO.eventCoupon(eventResult.getEventCouponCode());
		mav.addObject("couponView", couponResult);

		mav.addObject("eventView", eventResult);
		mav.setViewName("AdminEventView");
		return mav;
	}
	//이벤트 수정 전 정보 가져오기
	public ModelAndView eventBoardModify(int eventNum) {
		EventDTO eventResult = adminDAO.eventBoardView(eventNum);
		mav.addObject("eventView", eventResult);
		mav.setViewName("AdminEventModifyForm");
		return mav;
	}
	//이벤트 수정 처리
	public ModelAndView eventBoardModifyProcess(EventDTO event) throws IllegalStateException, IOException {
		MultipartFile eventFile = event.getEventImageFile();
		MultipartFile eventTitleFile = event.getEventTitleImageFile();
		
		String fileName = date.format(time)+"ㅡ"+eventFile.getOriginalFilename();
		String titleFileName = date.format(time)+"ㅡ"+eventTitleFile.getOriginalFilename();
		
		// 파일 저장 경로
		String savePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/eventFile/"+fileName;
		String saveTitlePath = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/eventFile/"+titleFileName;
		
		if(!eventFile.isEmpty()) {
			eventFile.transferTo(new File(savePath));
			event.setEventImage(fileName);
		}
		if(!eventTitleFile.isEmpty()) {
			eventTitleFile.transferTo(new File(saveTitlePath));
			event.setEventTitleImage(titleFileName);
		}
		adminDAO.eventBoardModifyProcess(event);
		mav.setViewName("redirect:/eventBoardView?eventNum="+event.getEventNum());
		return mav;
	}
	//이벤트 삭제
	public ModelAndView eventBoardDelete(int eventNum) {
		// 게시글 삭제 전 서버에 저장된 사진 삭제
		EventDTO event = adminDAO.eventBoardView(eventNum);
		String path = "";
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/beautyFile/"+event.getEventImage(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		path = "C:/Users/1/Desktop/RaiseAPet/src/main/webapp/resources/beautyFile/"+event.getEventTitleImage(); // 삭제할 파일의 경로
		file = new File(path);
		if(file.exists() == true){
			file.delete();
		}
		// 실제 DB에 저장된 게시글 삭제				
		adminDAO.eventBoardDelete(eventNum);
		mav.setViewName("redirect:/eventManagement");
		return mav;
	}
	//쿠폰 리스트 불러오기
	public List<CouponDTO> eventCouponList() {
		List<CouponDTO> couponList = adminDAO.eventCouponList();
		return couponList;
	}
/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
//리뷰 관리
	PageDTO paging = new PageDTO();
	private static final int BLOCK_LIMIT = 5;
	//리뷰 목록 조회
	public ModelAndView reviewBoardList(String kind, int page) {
		// 페이징처리에 사용될 글 개수 세기		
		int listCount = adminDAO.ListCount(kind); 
		int startRow = (page - 1) * 10 + 1;
		int endRow = page * 10;
		int maxPage = (int) (Math.ceil((double) listCount / 10));	// ceil : 값보다 큰 정수를 찾는 것.
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		paging.setEndRow(endRow);
		paging.setStartRow(startRow);
		paging.setEndPage(endPage);
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setMaxPage(maxPage);
		
		List<ReviewDTO> reviewResult = new ArrayList<ReviewDTO>();
		if(kind.equals("미용")) {
			reviewResult = adminDAO.beautyReview(paging);
			mav.addObject("reviewList", reviewResult);
		}else if(kind.equals("병원")) {
			reviewResult = adminDAO.medicalReview(paging);
			mav.addObject("reviewList", reviewResult);
		}else if(kind.equals("용품")) {
			reviewResult = adminDAO.goodsReview(paging);
			mav.addObject("reviewList", reviewResult);
		}else {
			reviewResult = adminDAO.hotelReview(paging);
			mav.addObject("reviewList", reviewResult);
		}
		mav.addObject("paging", paging);
		mav.setViewName("AdminReviewList");
		return mav;
	}
	//블라인드 처리
	public int reviewBlind(int reviewNum) {
		int blindResult=adminDAO.reviewBlind(reviewNum);
		return blindResult;
	}
/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
// 회원 관리	
	//회원 목록 조회
	public ModelAndView adminMemberList(int page) {
		// 페이징처리에 사용될 글 개수 세기		
		int listCount = adminDAO.memberCount(); 
		int startRow = (page - 1) * 10 + 1;
		int endRow = page * 10;
		int maxPage = (int) (Math.ceil((double) listCount / 10));	// ceil : 값보다 큰 정수를 찾는 것.
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		paging.setEndRow(endRow);
		paging.setStartRow(startRow);
		paging.setEndPage(endPage);
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setMaxPage(maxPage);
		
		mav.addObject("paging", paging);
				
		List<MemberDTO> memberResult = adminDAO.adminMemberList(paging);
		mav.addObject("memberList", memberResult);
		
		mav.setViewName("AdminMemberList");
		return mav;
	}
	//회원 상세보기
	public ModelAndView adminMemberView(String userId) {
		MemberDTO memberResult = adminDAO.adminMemberView(userId);
		mav.addObject("memberView", memberResult);
		mav.setViewName("AdminMemberView");
		return mav;
	}
	//회원 삭제
	public ModelAndView adminMemberDelete(String userId) {
		adminDAO.adminMemberDelete(userId);
		mav.setViewName("redirect:/adminMemberList");
		return mav;
	}
	//신고 목록 조회
	public HashMap<String, Object> adminMemberReport(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 페이징처리에 사용될 글 개수 세기		
				int listCount = adminDAO.reportCount(); 
				int startRow = (page - 1) * 10 + 1;
				int endRow = page * 10;
				int maxPage = (int) (Math.ceil((double) listCount / 10));	// ceil : 값보다 큰 정수를 찾는 것.
				int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
				int endPage = startPage + BLOCK_LIMIT - 1;
				if (endPage > maxPage) {
					endPage = maxPage;
				}
				paging.setEndRow(endRow);
				paging.setStartRow(startRow);
				paging.setEndPage(endPage);
				paging.setPage(page);
				paging.setStartPage(startPage);
				paging.setMaxPage(maxPage);
				
				map.put("paging", paging);
				
		List<ReportDTO> reportResult = adminDAO.adminMemerReport(paging);
		map.put("reportList", reportResult);
		return map;
	}
	//신고 처리
	public int adminMemberSuspend(ReportDTO report, int suspendDeadLine) {
		int result =0;
		//회원 정지
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reviewUserId", report.getReviewUserId());
		map.put("suspendDeadLine",suspendDeadLine);
		map.put("reportReviewNum",report.getReviewNum());
		map.put("reportUserId", report.getReportUserId());
	
		int suspendResult =adminDAO.reviewBlind(report.getReviewNum());
		
		//리뷰 블라인드
		if(suspendResult>0) {
			result = adminDAO.adminMemberReport(map);
			if(result>0) {
				adminDAO.adminReportDelete(map);
			}
		}
		return result;
	}
	//정지 회원 목록 가져오기
	public ModelAndView adminMemberSuspendList(int page) {
		// 페이징처리에 사용될 글 개수 세기		
		int listCount = adminDAO.suspendMemberCount(); 
		int startRow = (page - 1) * 10 + 1;
		int endRow = page * 10;
		int maxPage = (int) (Math.ceil((double) listCount / 10));	// ceil : 값보다 큰 정수를 찾는 것.
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		paging.setEndRow(endRow);
		paging.setStartRow(startRow);
		paging.setEndPage(endPage);
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setMaxPage(maxPage);
				
		mav.addObject("paging", paging);
		
		List<MemberDTO> memberResult = adminDAO.adminMemberSuspendList(paging);
		mav.addObject("suspendList", memberResult);
		mav.setViewName("AdminMemberSuspendList");
		return mav;
	}
	
	List<GoodsDTO> askList = new ArrayList<GoodsDTO>();
	//문의글 목록 가져오기
	public HashMap<String, Object> adminAskList(int page) {
		// 페이징처리에 사용될 글 개수 세기		
				int listCount = adminDAO.askCount(); 
				int startRow = (page - 1) * 10 + 1;
				int endRow = page * 10;
				int maxPage = (int) (Math.ceil((double) listCount / 10));	// ceil : 값보다 큰 정수를 찾는 것.
				int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
				int endPage = startPage + BLOCK_LIMIT - 1;
				if (endPage > maxPage) {
					endPage = maxPage;
				}
				paging.setEndRow(endRow);
				paging.setStartRow(startRow);
				paging.setEndPage(endPage);
				paging.setPage(page);
				paging.setStartPage(startPage);
				paging.setMaxPage(maxPage);
						
				mav.addObject("paging", paging);
				
		// 글 목록 가져오기
		askList = adminDAO.adminAskList(paging);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("paging", paging);
		map.put("askList", askList);
		
		
		return map;
	}
	//문의글 답변
	public int adminAskAnser(GoodsDTO goods) {
		int answerResult = adminDAO.adminAskAnswer(goods);
		return answerResult;
	}
	//쿠폰 작성
	public ModelAndView couponWrite(CouponDTO coupon) {
		String couponCode = init();
		coupon.setCouponCode(couponCode);
		adminDAO.couponWrite(coupon);
		mav.setViewName("redirect:/adminCouponList");
		return mav;
	}
	//쿠폰 번호 난수 발생
	public String init() {
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		int num=0;
		do {
			num=random.nextInt(75)+48;
			if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
				sb.append((char)num);
			}else {
				continue;
			}
		} while (sb.length() <12);
		return sb.toString();
	}
	//쿠폰 발행
	public ModelAndView adminMemberGiveACoupon(MemberDTO loginUser, String couponCode) {
		
		HashMap<String, String> coupon = new HashMap<String, String>();
		coupon.put("userId",loginUser.getUserId());
		coupon.put("couponCode", couponCode);
		adminDAO.adminMemberGiveACoupon(coupon);
		return mav;
	}
	//쿠폰 리스트 불러오기
	public ModelAndView adminCouponList() {
		List<CouponDTO> couponList = adminDAO.eventCouponList();
		mav.addObject("couponList", couponList);
		mav.setViewName("AdminCouponList");
		return mav;
	}
/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
// 예약 및 결제 관리
	//호텔
	public ModelAndView adminHotelReserveList(int page) {
		// 페이징처리에 사용될 글 개수 세기		
		int listCount = adminDAO.hotelReserveCount(); 
		int startRow = (page - 1) * 10 + 1;
		int endRow = page * 10;
		int maxPage = (int) (Math.ceil((double) listCount / 10));	// ceil : 값보다 큰 정수를 찾는 것.
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		paging.setEndRow(endRow);
		paging.setStartRow(startRow);
		paging.setEndPage(endPage);
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setMaxPage(maxPage);
				
		mav.addObject("paging", paging);
	
		
		//호텔 예약 리스트 가져오기
		List<HotelDTO> hotelResult = adminDAO.adminHotelReserveList(paging);
		
		//날짜만 화면에 도출할 수 있도록 해주는 작업
		for(int i=0;i<hotelResult.size();i++) {
			String[] hotelCheckIn = hotelResult.get(i).getHotelCheckIn().split(" ");
			hotelResult.get(i).setHotelCheckIn(hotelCheckIn[0]);
			String[] hotelCheckOut = hotelResult.get(i).getHotelCheckOut().split(" ");
			hotelResult.get(i).setHotelCheckOut(hotelCheckOut[0]);
		}
		
		mav.addObject("hotelReserveList", hotelResult);
		mav.setViewName("HotelReserveList");
		return mav;
	}
	//미용
	public ModelAndView adminBeautyReserveList(int page) {
		// 페이징처리에 사용될 글 개수 세기		
				int listCount = adminDAO.beautyReserveCount(); 
				int startRow = (page - 1) * 10 + 1;
				int endRow = page * 10;
				int maxPage = (int) (Math.ceil((double) listCount / 10));	// ceil : 값보다 큰 정수를 찾는 것.
				int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
				int endPage = startPage + BLOCK_LIMIT - 1;
				if (endPage > maxPage) {
					endPage = maxPage;
				}
				paging.setEndRow(endRow);
				paging.setStartRow(startRow);
				paging.setEndPage(endPage);
				paging.setPage(page);
				paging.setStartPage(startPage);
				paging.setMaxPage(maxPage);
						
				mav.addObject("paging", paging);
		
		List<BeautyDTO> beautyResult = adminDAO.adminBeautyReserveList(paging);
		for(int i=0;i<beautyResult.size();i++) {
			String[] beautyDate = beautyResult.get(i).getBeautyReserveDate().split(" ");
			beautyResult.get(i).setBeautyReserveDate(beautyDate[0]);
		}
		mav.addObject("beautyReserveList", beautyResult);
		mav.setViewName("BeautyReserveList");
		return mav;
	}
	//병원
	public ModelAndView adminMedicalReserveList(int page) {
		// 페이징처리에 사용될 글 개수 세기		
				int listCount = adminDAO.medicalReserveCount(); 
				int startRow = (page - 1) * 10 + 1;
				int endRow = page * 10;
				int maxPage = (int) (Math.ceil((double) listCount / 10));	// ceil : 값보다 큰 정수를 찾는 것.
				int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
				int endPage = startPage + BLOCK_LIMIT - 1;
				if (endPage > maxPage) {
					endPage = maxPage;
				}
				paging.setEndRow(endRow);
				paging.setStartRow(startRow);
				paging.setEndPage(endPage);
				paging.setPage(page);
				paging.setStartPage(startPage);
				paging.setMaxPage(maxPage);
						
				mav.addObject("paging", paging);
				
		List<MedicalDTO> medicalResult = adminDAO.adminMedicalReserveList(paging);
		
		for(int i=0;i<medicalResult.size();i++) {
			String[] medicalDate = medicalResult.get(i).getMedicalReserveDate().split(" ");
			medicalResult.get(i).setMedicalReserveDate(medicalDate[0]);
		}
		mav.addObject("medicalReserveList", medicalResult);
		mav.setViewName("MedicalReserveList");
		return mav;
	}
	//용품
	public ModelAndView adminGoodsBuyList(int page) {
		// 페이징처리에 사용될 글 개수 세기		
				int listCount = adminDAO.goodsBuyCount(); 
				int startRow = (page - 1) * 10 + 1;
				int endRow = page * 10;
				int maxPage = (int) (Math.ceil((double) listCount / 10));	// ceil : 값보다 큰 정수를 찾는 것.
				int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
				int endPage = startPage + BLOCK_LIMIT - 1;
				if (endPage > maxPage) {
					endPage = maxPage;
				}
				paging.setEndRow(endRow);
				paging.setStartRow(startRow);
				paging.setEndPage(endPage);
				paging.setPage(page);
				paging.setStartPage(startPage);
				paging.setMaxPage(maxPage);
						
				mav.addObject("paging", paging);
				
		List<GoodsDTO> goodsResult = adminDAO.adminGoodsBuyList(paging);
		mav.addObject("goodsBuyList", goodsResult);
		mav.setViewName("GoodsBuyList");
		return mav;
	}
}
