package kr.co.mypet.sitter.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;

import kr.co.mypet.common.model.MemberVo;
import kr.co.mypet.common.model.MypetVo;
import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.common.model.PetkindVo;
import kr.co.mypet.sitter.model.FaqVo;
import kr.co.mypet.sitter.model.PetSitterVo;
import kr.co.mypet.sitter.model.SitterAppVo;
import kr.co.mypet.sitter.model.SitterResVo;
import kr.co.mypet.sitter.model.SitterRevVo;
import kr.co.mypet.sitter.model.ZipVo;
import kr.co.mypet.sitter.service.SitterServiceInf;
import kr.co.mypet.util.StringUtil;

@Controller
@RequestMapping("/sit")
public class SitterController {

	@Resource(name="sitterService")
	private SitterServiceInf sitterService;
	
	// 펫시터 메인화면
	@RequestMapping("/sitMain")
	public String MainView() {
		return "petSitter/petSitter";
	}
	
	// 펫시터 집으로 부르기 화면
	@RequestMapping("/sitterFrom")
	public String sitterFrom(HttpSession session, Model model) {
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		if(memVo != null) {
			List<MypetVo> mypetList = sitterService.getMypetList(memVo.getMem_id());
			model.addAttribute("mypetList", mypetList);
			return "petSitter/sitterFrom";
		} else {
			return "redirect:/mem/loginPage";
		}
		
	}
	
	// 펫시터 집으로 부르기 -> 주소변경 화면
	@RequestMapping(value= {"/sitFromAddrPopUp"}, method= {RequestMethod.GET})
	public String sitFromAddrPopUpView() {
		return "petSitter/addressUpdate";
	}
	
	// 펫시터 집으로 부르기 -> 주소변경 화면
	@RequestMapping(value= {"/mypetInsertView"}, method= {RequestMethod.GET})
	public String mypetInsertView() {
		return "petSitter/mypetInsert";
	}
	
	// 펫시터 집으로 부르기 -> 주소변경 화면 -> 수정완료 처리
	@RequestMapping(value= {"/addressUpdate"}, method= {RequestMethod.POST})
	public String sitFromAddrPopUp(Model model, HttpSession session, @RequestParam("mem_addr1")String mem_addr, @RequestParam("mem_addr2")String mem_addr2) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		Map<String, Object> param = new HashMap<>();
		param.put("mem_id", memVo.getMem_id());
		param.put("mem_addr", mem_addr);
		param.put("mem_addr2", mem_addr2);
		
		int updateCnt = sitterService.memAddrUpdate(param);
		
		if(updateCnt !=0) {
			model.addAttribute("updateCnt", updateCnt);
			memVo.setMem_addr(mem_addr);
			memVo.setMem_addr2(mem_addr2);
			return "petSitter/addressUpdate";
		}
		else {
			return "petSitter/addressUpdate";
		}
	}
	
	// ajax 처리(나의 반려동물 정보 추가의 품종 선택)
	@RequestMapping("/petKindHtml")
	public String petKindHtml(Model model, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String petKind = request.getParameter("petKind");
		
		List<PetkindVo> petKindList = sitterService.getPetKindList(petKind);
		
		model.addAttribute("petKindList", petKindList);
		
		return "petSitter/petKindAjaxHtml";
	}
	
	// 펫시터 집으로 부르기 -> 나의 반려동물 정보 추가 처리
	@RequestMapping("/mypetInsert")
	public String mypetInsert(HttpSession session, HttpServletRequest request, @RequestPart("petImgForm")MultipartFile part) throws Exception, IOException {
		// 회원 정보 받아오는 부분
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		String cnt = request.getParameter("cnt");
		System.out.println("cnt : "+cnt);
		
		// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
		if (memVo == null) {
			return "petInsurance/memLoginChk";
		} else {
			// 나의 펫에 추가하려며 있어야 하는 부분 
			// myp_mem , myp_petk ,myp_birth , myp_sick ,myp_img ,myp_neu ,myp_gender,myp_name
			//	myp_id -> 시퀀스로 처리
			// mypetVo에 입력하기
			MypetVo mypetVo = new MypetVo();
			
			// 생년월일 Date 타입으로 변경하기
			String birth = request.getParameter("petBirthForm");
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			Date dateBirth = date.parse(birth);

			mypetVo.setMyp_mem(memVo.getMem_id());
			mypetVo.setMyp_name(request.getParameter("petName"));
			mypetVo.setMyp_gender(request.getParameter("petGender"));
			mypetVo.setMyp_petk(request.getParameter("petKindForm"));
			mypetVo.setMyp_birth(dateBirth);
			mypetVo.setMyp_neu(request.getParameter("petNTL"));
			mypetVo.setMyp_sick(request.getParameter("petSick"));
			
			// 파일 저장되기
			
			// 실제 파일 저장될 경로 설정하기
			String path = "D:\\A_TeachingMaterial\\7.LastProject\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\mypet\\img\\petimg";
			String str = part.getOriginalFilename();
			
			// 파일명 가지고 오기
			if(str == "") {
				mypetVo.setMyp_img("/img/petimg/noimg.jpg");
			}else {
				// 확장자만 빼기(확장자는 저장해줘야 한다)
				String fileExt = StringUtil.getFileExt(str);
				String fileName = UUID.randomUUID().toString() + fileExt;	// 충돌 방지를 위한 임의의 파일명 
				
				File file = new File(path + File.separator + fileName);
				
				part.transferTo(file);
				
				str = "/img/petimg/"+fileName;
				
				// DB 넣어주기
				mypetVo.setMyp_img(str);
			}
			
			int insertCnt = sitterService.insertMyPet(mypetVo);
			
			if(cnt.equals("0")) {
				return "redirect:/sit/sitterFrom";
			} else {
				return "redirect:/sit/myPage";
			}
			
		}
	}
	
	// 나의 반려동물 정보 수정
	@RequestMapping("/mypetUpdateView")
	public String mypetUpdate(@RequestParam("mypet_id")String mypet_id, Model model) {
		
		MypetVo mypVo = sitterService.getPetInfo(mypet_id);
		
		System.out.println("mypVo : "+mypVo);
		
		model.addAttribute("mypVo", mypVo);
		
		return "petSitter/mypetUpdate";
	}
	
	// 나의 반려동물 정보 수정 처리
	@RequestMapping("/mypetUpdate")
	public String mypetUpdate(HttpServletRequest request, @RequestParam("petId")String petId, @RequestParam("petName")String petName, @RequestParam("petGender")String petGender, @RequestParam("petNTL")String petNTL,
			@RequestParam("petBirthForm")String petBirthForm, @RequestParam("petSick")String petSick, @RequestPart("petImgForm")MultipartFile part,
			@RequestParam("petPreImg")String petPreImg) throws Exception {
		
		MypetVo mypetVo = new MypetVo();
		mypetVo.setMyp_id(petId);
		mypetVo.setMyp_name(petName);
		mypetVo.setMyp_gender(petGender);
		mypetVo.setMyp_neu(petNTL);
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		Date date = dt.parse(petBirthForm);
		mypetVo.setMyp_birth(date);
		mypetVo.setMyp_sick(petSick);
		
		// 실제 파일 저장될 경로 설정하기
		String path1 = request.getSession().getServletContext().getRealPath("");
		String path = path1+"\\img\\petimg";
		String str = part.getOriginalFilename();
		
		// 파일명 가지고 오기
		if(str == "") {
			mypetVo.setMyp_img(petPreImg);
		}else {
			// 확장자만 빼기(확장자는 저장해줘야 한다)
			String fileExt = StringUtil.getFileExt(str);
			String fileName = UUID.randomUUID().toString() + fileExt;	// 충돌 방지를 위한 임의의 파일명 
			
			File file = new File(path + File.separator + fileName);
			
			part.transferTo(file);
			
			str = "/img/petimg/"+fileName;
			
			// DB 넣어주기
			mypetVo.setMyp_img(str);
		}
		
		System.out.println("mypetVo :" + mypetVo);
		
		int updateCnt = sitterService.updateMypetInfo(mypetVo);
		
		return "redirect:/sit/myPage";
	}
	
	// 나의 반려동물 정보 삭제
	@RequestMapping("/mypetDel")
	public String mypetDel(HttpSession session, Model model, @RequestParam("mypet_id")String mypet_id, @RequestParam("cnt")String cnt) {
		
		String[] mypetId = mypet_id.split(" ");
		
		for(int i=0;i<mypetId.length;i++) {
			int deleteCnt = sitterService.deleteMypet(mypetId[i]);
		}
		System.out.println("cnt : "+cnt);
		if(cnt.equals("0")) {
			return "redirect:/sit/sitterFrom";
		} else {
			MemberVo memVo = (MemberVo) session.getAttribute("memVo");
			
			List<MypetVo> mypetList = sitterService.getMypetList(memVo.getMem_id());
			
			model.addAttribute("mypetList", mypetList);
			
			return "petSitter/mypageMypet";
		}
	}
	
	// 펫시터 집으로 부르기 -> 예약하기
	@RequestMapping("/reservation")
	public String reservation(HttpServletRequest request, Model model) {
		String mypet = request.getParameter("mypet");
		String time = request.getParameter("time");
		String timeChk = request.getParameter("timeSelect");
		String spec = request.getParameter("spec");
		String arr = request.getParameter("arr");
		String date = request.getParameter("dateChooice");
		
		MemberVo memVo = (MemberVo) request.getSession().getAttribute("memVo");		
		String mem_id = memVo.getMem_id();
		String[] mypets = mypet.split(" ");
		MypetVo mVo = null;
		List<MypetVo> list = new ArrayList<>();
		
		int nomalPrice = 28000;
		int addPrice = 15000;
		int price = (nomalPrice)+((addPrice * Integer.parseInt(timeChk))); 

		for(int i=0; i< mypets.length;i++) {
			mVo = sitterService.getPetInfo(mypets[i]);
			list.add(mVo);
			
			Map<String, Object> param = new HashMap<>();
			param.put("str_spec", spec);
			param.put("str_price", price);
			param.put("str_date", date);
			param.put("str_time", time);
			param.put("str_atime", timeChk);
			param.put("str_arr", arr);
			param.put("str_pst", "");
			param.put("str_mem", mem_id);
			param.put("str_myp", mVo.getMyp_id());
			param.put("str_start", "");
			param.put("str_stop", "");
			
			int resCnt = sitterService.insertReservation(param);
		}
		
//		model.addAttribute("list", list);
		
		model.addAttribute("mypet", mypet);
		model.addAttribute("time", time);
		model.addAttribute("timeChk", timeChk);
		model.addAttribute("spec", spec);
		model.addAttribute("nomalPrice", nomalPrice);
		model.addAttribute("addPrice", addPrice);
		model.addAttribute("mypetCnt", mypets.length);
		model.addAttribute("date",date);
		
		return "redirect:/sit/reservationView";
	}
	
	@RequestMapping("/reservationView")
	public String reservationView(HttpServletRequest request, @RequestParam("time")String time, @RequestParam("timeChk")String timeChk,
			@RequestParam("spec")String spec, @RequestParam("nomalPrice")int nomalPrice, @RequestParam("addPrice")int addPrice, @RequestParam("mypetCnt")int mypetCnt,
			@RequestParam("date")String date, Model model) {
		
		String mypet = request.getParameter("mypet");
		String[] mypets = mypet.split(" ");
		List<MypetVo> list = new ArrayList<>();
		MypetVo mypVo = null;
		
		for(int i=0;i<mypets.length;i++) {
			mypVo = sitterService.getPetInfo(mypets[i]);
			list.add(mypVo);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("time", time);
		model.addAttribute("timeChk", timeChk);
		model.addAttribute("spec", spec);
		model.addAttribute("nomalPrice", nomalPrice);
		model.addAttribute("addPrice", addPrice);
		model.addAttribute("mypetCnt", mypetCnt);
		model.addAttribute("date",date);
		
		return "petSitter/reservation";
	}
	
	// 펫시터 집에 맡기기 화면
	@RequestMapping("/sitterTo")
	public String sitterTo(Model model, HttpServletRequest request) {
		String zip = request.getParameter("zip");
		String ziphigh = request.getParameter("zipHigh");
		
		if(ziphigh != null) {
			if(ziphigh == "") {
				
			} else {
				ziphigh = ziphigh.substring(0, 2);
			}
		}
		Map<String, Object> param = new HashMap<>();
		param.put("zip_low", zip);
		param.put("zip_high", ziphigh);
		
		String sort = request.getParameter("sort");
		List<PetSitterVo> sitList = new ArrayList<>();
		
		if( (sort != null) && (ziphigh != null || ziphigh != "")) {
			int sortCnt = Integer.parseInt(request.getParameter("sort"));
			if(sortCnt ==1) {
				sitList = sitterService.petNoticeListSearchDate(param);
				
				model.addAttribute("sitList", sitList);
				model.addAttribute("zip",zip);
				model.addAttribute("zipHigh", ziphigh);
			} else if(sortCnt == 2) {
				sitList = sitterService.petNoticeListSearchCount(param);
				
				model.addAttribute("sitList", sitList);
				model.addAttribute("zip",zip);
				model.addAttribute("zipHigh", ziphigh);
			}
		} else if(sort != null && (ziphigh == null || ziphigh == "")) {
			int sortCnt = Integer.parseInt(request.getParameter("sort"));
			if(sortCnt == 1) {
				sitList = sitterService.petNoticeListDate();
				
				model.addAttribute("sitList", sitList);
			} else if(sortCnt == 2) {
				sitList = sitterService.petNoticeListCount();
				
				model.addAttribute("sitList", sitList);
			} 
			
		} else if(sort == null && ziphigh != null) {
			sitList = sitterService.petNoticeListSearch(param);
			
			model.addAttribute("sitList", sitList);
			model.addAttribute("zip",zip);
			model.addAttribute("zipHigh", ziphigh);
			
		} else if(sort == null && ziphigh == null){
			
			sitList = sitterService.petNoticeList();
			
			model.addAttribute("sitList", sitList);
			
		}
		
		
		MemberVo memVo = (MemberVo) request.getSession().getAttribute("memVo");
		if(memVo != null) {
			int count = sitterService.getMySitterToCount(memVo.getMem_id());
			model.addAttribute("count", count);
		} else {
			model.addAttribute("count", 0);
		}
				
		List<ZipVo> zipList = sitterService.zipList();
		
		request.getServletContext().setAttribute("zipList", zipList);
		
		return "petSitter/sitterTo";
	}
	
	@RequestMapping("/sitDelete")
	public String sitDelete(HttpSession session) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		int deleteCnt = sitterService.deleteMySitterTo(memVo.getMem_id());
		
		return "redirect:/sit/sitterTo";
	}
	
	// 펫시터 집에 맡기기 상세화면
	@RequestMapping("/sitDetail")
	public String sitterDetail(Model model, @RequestParam("pst_id")String pst_id, HttpSession session) {
		
		PetSitterVo pstVo = sitterService.petToHomeDetail(pst_id);
		
		int count = pstVo.getPst_view();
		
		pstVo.setPst_view(count+1);
		
		Map<String, Object> param = new HashMap<>();
		param.put("pst_id", pst_id);
		param.put("pst_view", pstVo.getPst_view());
		
		int updateCnt = sitterService.petNoticeCountUpdate(param);
		
		model.addAttribute("pstVo", pstVo);
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		Map<String, Object> map = new HashMap<>();
		if(memVo != null) {
			map.put("pc_mem", memVo.getMem_id());
		} else {
			map.put("pc_mem", "");
		}
		map.put("pc_pst", pst_id);
		
		int chk = sitterService.getPetsitterChk(map);
		
		model.addAttribute("chk", chk);
		
		return "petSitter/sitterDetail";
	}
	
	// 펫시터 집에 맡기기 - 게시글 등록 화면
	@RequestMapping("/sitterToInsertView")
	public String sitterToInsertView() {
		
		return "petSitter/sitterToInsert";
	}
	
	// 펫시터 집에 맡기기 - 후기글 리스트 조회
	@RequestMapping("/reviewPageListAjaxHtml")
	public String reviewPageListAjaxHtml(PageVo pageVo, @RequestParam("pst_id")String pst_id, Model model) {
		
		String stv_pst = pst_id;
		
		Map<String, Object> param = new HashMap<>();
		param.put("page", pageVo.getPage());
		param.put("pageSize", pageVo.getPageSize());
		param.put("stv_pst", stv_pst);
		
		Map<String, Object> resultMap = sitterService.getReviewList(param);
		
		List<SitterRevVo> reviewList = (List<SitterRevVo>) resultMap.get("reviewList");
		model.addAttribute("reviewList", reviewList);
		
		return "/petSitter/reviewPageListAjaxHtml";				
	}
	@RequestMapping("/reviewPaginationAjaxHtml")
	public String reviewPaginationAjaxHtml(PageVo pageVo, @RequestParam("pst_id")String pst_id, Model model) {
				
		String stv_pst = pst_id;
		
		Map<String, Object> param = new HashMap<>();
		param.put("page", pageVo.getPage());
		param.put("pageSize", pageVo.getPageSize());
		param.put("stv_pst", stv_pst);
		
		Map<String, Object> resultMap = sitterService.getReviewList(param);
		
		List<SitterRevVo> reviewList = (List<SitterRevVo>) resultMap.get("reviewList");
		int pageCnt = (int) resultMap.get("pageCnt");
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("page", pageVo.getPage());
		model.addAttribute("stv_pst", stv_pst);
		
		return "/petSitter/reviewPaginationAjaxHtml";
	}
	
	// 후기 게시글 등록
	@RequestMapping("/insertReview")
	public String insertReview(@RequestParam("pst_id")String pst_id, @RequestParam("stv_text")String stv_text, HttpSession session) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		Map<String, Object> param = new HashMap<>();
		param.put("stv_pst", pst_id);
		param.put("stv_text", stv_text);
		param.put("stv_mem", memVo.getMem_id());
		
		int insertCnt = sitterService.insertReview(param);
		
		return "redirect:/sit/sitDetail?pst_id="+pst_id;
	}
	
	// 후기 게시글 수정
	@RequestMapping("/updateReview")
	public String updateReview(@RequestParam("revText")String revText, @RequestParam("stv_id")String stv_id, @RequestParam("pst_id")String pst_id) {
		Map<String, Object> param = new HashMap<>();
		param.put("stv_text", revText);
		param.put("stv_id", stv_id);
		
		int updateCnt = sitterService.updateReview(param);
		
		return "redirect:/sit/sitDetail?pst_id="+pst_id;
	}
	
	@RequestMapping("/deleteReview")
	public String deleteReview(@RequestParam("stvID")String stv_id, @RequestParam("pst_id")String pst_id) {
		
		int deleteCnt = sitterService.deleteReview(stv_id);
		
		return "redirect:/sit/sitDetail?pst_id="+pst_id;
	}
	
	@RequestMapping("/sitterToInsert")
	public String sitterToInsert(HttpServletRequest request, @RequestParam("notice_title")String notice_title, @RequestParam("pst_text")String pst_text,
			@RequestParam("chkIn")String pst_cidate,@RequestParam("chkOut")String pst_codate, @RequestParam("chkIn2")String pst_cidate2,@RequestParam("chkOut2")String pst_codate2,
			@RequestPart("notice_file")MultipartFile part, @RequestParam("price_dc")String price_dc, @RequestParam("price_1d")String price_1d, HttpSession session) throws Exception, IOException {

		MemberVo memVo = (MemberVo) session.getAttribute("memVo");

		PetSitterVo pstVo = new PetSitterVo();

		// 로그인을 안한 회원일 경우에는 로그인 화면으로 이동
		if (memVo == null) {
			return "petSitter/sitterDetail";
		} else {

			// 실제 파일 저장될 경로 설정하기
			String path1 = request.getSession().getServletContext().getRealPath("");
			String path = path1+"\\img\\petSitterImg";
			String str = part.getOriginalFilename();

			// 파일명 가지고 오기
			if (str == "") {
				pstVo.setPst_img("/img/petimg/noimg.jpg");
			} else {
				// 확장자만 빼기(확장자는 저장해줘야 한다)
				String fileExt = StringUtil.getFileExt(str);
				String fileName = UUID.randomUUID().toString() + fileExt; // 충돌 방지를 위한 임의의 파일명

				File file = new File(path + File.separator + fileName);

				part.transferTo(file);

				str = "/img/petSitterImg/" + fileName;

				// DB 넣어주기
				pstVo.setPst_img(str);
			}
			
			String cidate = pst_cidate + " ~ "+ pst_codate2;
			String codate = pst_codate + " ~ "+ pst_codate2;
			
			String[] string = pst_text.split("\\r\\n");
			
			pstVo.setPst_mem(memVo.getMem_id());
			pstVo.setPst_price1(Integer.parseInt(price_dc));
			pstVo.setPst_price2(Integer.parseInt(price_1d));
			pstVo.setPst_text(pst_text);
			pstVo.setPst_title(notice_title);
			pstVo.setPst_cidate(cidate);
			pstVo.setPst_codate(codate);
			
			int insertCnt = sitterService.insertSitterTo(pstVo);
			
			return "redirect:/sit/sitterTo";

		}

	}
	
	// FAQ 게시판 화면
	@RequestMapping("/faq")
	public String faq(Model model) {
		List<FaqVo> faqList = sitterService.getFaqList();
		model.addAttribute("faqList", faqList);
		return "petSitter/faq";
	}
	
	// FAQ 게시판 상세화면
	@RequestMapping("/faqDetail")
	public String faqDetail(Model model, @RequestParam("faqId")String psf_id) {
		
		FaqVo fVo = sitterService.getFaqOne(psf_id);
		
		model.addAttribute("fVo", fVo);
		
		return "petSitter/faqDetail";
	}
	
	// faq 수정화면 이동
	@RequestMapping("/faqUpdateView")
	public String faqUpdateView(Model model, @RequestParam("faq_id")String psf_id) {
		FaqVo faqVo =  sitterService.getFaqOne(psf_id);
		model.addAttribute("faqVo", faqVo);
		return "petSitter/faqUpdate";
	}
	
	// faq 수정처리
	@RequestMapping("/faqUpdate")
	public String faqUpdate(@RequestParam("psf_id")String psf_id, @RequestParam("faq_name")String psf_name, @RequestParam("smarteditor")String psf_text) {
		Map<String, Object> param = new HashMap<>();
		param.put("psf_id", psf_id);
		param.put("psf_name", psf_name);
		param.put("psf_text", psf_text);
		
		int updateCnt = sitterService.updateFaq(param);
		
		return "redirect:/sit/faq";
	}
	
	// faq 삭제 처리
	@RequestMapping("/faqDelete")
	public String faqDelete(@RequestParam("faq_id")String psf_id) {
		int deleteCnt = sitterService.deleteFaq(psf_id);
		
		return "redirect:/sit/faq";
	}
	

	// faq 등록화면 이동
	@RequestMapping("/faqInsertView")
	public String faqInsertView() {
		return "petSitter/faqInsert";
	}
	
	// faq 등록 처리
	@RequestMapping("/faqInsert")
	public String faqInsert(@RequestParam("faq_name")String psf_name, @RequestParam("smarteditor")String psf_text) {
		Map<String, Object> param = new HashMap<>();
		param.put("psf_name", psf_name);
		param.put("psf_text", psf_text);
		
		int insertCnt = sitterService.insertFaq(param); 
		
		if(insertCnt !=0) {
			String psf_id = sitterService.getMaxFaq();
			
			return "redirect:/sit/faqDetail?faqId="+psf_id;
		}
		
		return "redirect:/sit/faqInsertView";
		
	}
	
	// 펫시터 지원하기 화면
	@RequestMapping("/support")
	public String support() {
		return "petSitter/support";
	}
	
	// 펫시터 지원하기 화면1
	@RequestMapping("/supportApplicationAjaxHtml")
	public String supportApplicationAjaxHtml() {
		return "petSitter/supportApplication";
	}
	
	// 펫시터 지원하기 화면2
	@RequestMapping("/supportApplicationAjaxHtml2")
	public String supportApplicationAjaxHtml2() {
		return "petSitter/supportApplication2";
	}
	
	// 펫시터 지원하기
	@RequestMapping("/supportInsert")
	public String supportInsert(HttpSession session, @RequestParam("memName")String memName, @RequestParam("memTel")String memTel, @RequestParam("memBirth")String memBirth,
			@RequestParam("memAddr")String memAddr, @RequestParam("memJob")String memJob, @RequestParam("memQna1")String memQna1, @RequestParam("memQna2")String memQna2,
			@RequestParam("memQna3")String memQna3, @RequestParam("memQna4")String memQna4, @RequestParam("memQna5")String memQna5) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		String sta_text = memName + memTel + memBirth + memAddr + memJob + memQna1 + memQna2 + memQna3 + memQna4 + memQna5;
		
		Map<String, Object> param = new HashMap<>();
		param.put("sta_mem", memVo.getMem_id());
		param.put("sta_text", sta_text);
		
		int insertCnt = sitterService.insertSupport(param);
		
		return "petSitter/petSitter";
	}
	
	// 마이페이지 화면
	@RequestMapping("/myPage")
	public String myPage() {
		return "petSitter/myPage";
	}
	
	// 마이페이지 예약관리 화면
	@RequestMapping("/mypageReservationAjaxHtml")
	public String mypageAjaxHtml(HttpSession session, Model model) {
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		List<SitterResVo> resList = sitterService.getReservationList(memVo.getMem_id());
		
		model.addAttribute("resList", resList);
		System.out.println("resList : "+resList);
		
		return "petSitter/mypageReservation";
	}
	
	// 마이페이지 예약관리 예약취소 처리
	@RequestMapping("/reservationDelete")
	public String reservationDelete(@RequestParam("resId")String resId) {
		String[] res_id = resId.split(" ");
		
		for(int i=0;i<res_id.length;i++) {
			sitterService.deleteReservation(res_id[i]);
		}
		
		return "redirect:/sit/myPage";
	}
	
	// 마이페이지 게시글 관리 화면
	@RequestMapping("/mypageNoticeAjaxHtml")
	public String mypageNoticeAjaxHtml(HttpSession session, Model model) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		List<SitterRevVo> myReviewList = sitterService.getMyReviewList(memVo.getMem_id());
		
		model.addAttribute("myReviewList",myReviewList);
		
		return "petSitter/mypageNotice";
	}
	
	// 마이페이지 FAQ 관리 화면
	@RequestMapping("/mypageFaqAjaxHtml")
	public String mypageFaqAjaxHtml(Model model) {
		
		List<FaqVo> faqList = sitterService.getFaqList();
		
		model.addAttribute("faqList", faqList);
		
		return "admin/petSitter/mypageFaq";
	}
	
	// 마이페이지 FAQ 삭제 처리
	@RequestMapping("/mypageFaqDelete")
	public String mypageFaqDelete(@RequestParam("faq_id")String psf_id, Model model) {
		
		String[] psfId = psf_id.split(" ");
		
		for(int i=0;i<psfId.length;i++) {
			sitterService.deleteFaq(psfId[i]);
		}
		
		List<FaqVo> faqList = sitterService.getFaqList();
		
		model.addAttribute("faqList", faqList);
		
		return "admin/petSitter/mypageFaq";
	}
	
	// 마이페이지 반려동물 관리 화면
	@RequestMapping("/mypageMypetAjaxHtml")
	public String mypageMypetAjaxHtml(HttpSession session, Model model) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		List<MypetVo> mypetList = sitterService.getMypetList(memVo.getMem_id());
		
		model.addAttribute("mypetList", mypetList);
		
		return "petSitter/mypageMypet";
	}
	
	// 마이페이지 펫시터 지원관리
	@RequestMapping("/mypageSupportAjaxHtml")
	public String mypageSupportAjaxHtml(HttpSession session, Model model) {
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		SitterAppVo staVo = sitterService.getMySupport(memVo.getMem_id());
		
		if(staVo != null) {
			String[] sta_text = staVo.getSta_text().split("- ");
			for(int i=0;i<sta_text.length;i++) {
				model.addAttribute("sta_text"+i, sta_text[i]);
			}
		}
		model.addAttribute("staVo", staVo);
		
		return "petSitter/mypageSupport";
	}
	
	// 마이페이지 펫시터 지원 취소 처리
	@RequestMapping("/supportCancle")
	public String supportCancle(@RequestParam("sta_id")String sta_id) {
		int deleteCnt = sitterService.deleteSupport(sta_id);
		
		return "petSitter/mypageSupport";
	}
	
	// 마이페이지 펫시터 지원관리 -> PDF생성 준비 및 상태변경
	@RequestMapping("/supportPDF")
	public String supportPDF(HttpServletRequest request, Model model, PageVo pageVo) {
		
		String sta_id = request.getParameter("staId");
		String[] staId = sta_id.split(" ");
		String[] staID = new String[staId.length];
		
		for(int i=0; i<staId.length;i++) {
			int updateCnt = sitterService.updateSupportSuc(staId[i]);
			staID[i] = staId[i];
		}
		
		String sta_mem = request.getParameter("sta_mem");
		String[] staMem = sta_mem.split(" ");

		String[] memName = new String[staMem.length];
		String[] memBirth = new String[staMem.length];
		String[] memId = new String[staMem.length];
		
		for(int i=0; i<staMem.length; i++) {
			int updateCnt = sitterService.updateMemeberSit(staMem[i]);
			SitterAppVo staVo = sitterService.getMySupport(staMem[i]);
			String[] text = staVo.getSta_text().split("- ");
			String[] mem_name = text[1].split("/");
			memName[i] = mem_name[0];
			memBirth[i] = text[3];
			memId[i] = staMem[i];
		}
		
		model.addAttribute("memId", memId);
		model.addAttribute("memName", memName);
		model.addAttribute("memBirth", memBirth);
		model.addAttribute("staId", staID);
		model.addAttribute("page", pageVo.getPage());
		model.addAttribute("pageSize", pageVo.getPageSize());
		
		return "redirect:/sit/supportPDFCreate";
	}
	

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	// 펫시터 지원 합격증 생성
	@RequestMapping("/supportPDFCreate")
	public String pdfCreate(Model model, @RequestParam("page")int page, @RequestParam("pageSize")int pageSize, final HttpServletRequest request, 
			@RequestParam("memName")String[] memName, @RequestParam("memBirth")String[] memBirth, @RequestParam("staId")String[] staId,
			@RequestParam("memId")String[] memId) throws DocumentException, IOException {
		
		String[] name = memName;
		String[] birth = memBirth;
		String[] sta_id = staId;
		final String[] mem_id = memId;
		
		for(int i=0; i<name.length; i++) {
			final String to = mem_id[i];
			String path1 = request.getSession().getServletContext().getRealPath("");
			String dir = path1 + "\\upload\\petSitter_SUC";
			final String fileName = UUID.randomUUID().toString()+".pdf";
			
			File directory = new File(dir);
			if(!directory.exists()) {
				directory.mkdirs(); // 파일경로 없으면 생성
			}
			Document document = new Document(PageSize.A4,75,50,120,0); // 용지 및 여백 설정
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(dir+"/"+fileName));
			document.open();
			
			Image jpg = Image.getInstance(path1 + "\\img\\petSitterImg\\petsitter_suc.jpg");
			document.add(jpg);
			
			BaseFont bf = BaseFont.createFont(path1 + "\\font\\korean.h2gtrm.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
			
			PdfContentByte cb = writer.getDirectContent();
			cb.beginText();
			cb.setColorFill(new BaseColor(0,0,0));
			cb.setFontAndSize(bf, 20);
			cb.setTextMatrix(210,559);
			cb.showText("펫시터");
			cb.setTextMatrix(210,517);
			cb.showText(name[i]);
			cb.setTextMatrix(210,475);
			cb.showText(birth[i]);
			cb.endText();
			
			document.close();
			writer.close();
			
			Map<String, Object> param = new HashMap<>();
			param.put("sta_id", staId[i]);
			param.put("sta_file", fileName);
			
			int updateCnt = sitterService.updateSupportFile(param);
			
			if(updateCnt != 0) {
				final MimeMessagePreparator preparator = new MimeMessagePreparator() {
					@Override
					public void prepare(MimeMessage mimeMessage) throws Exception {
						final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
						helper.setFrom("sjyounghos@naver.com");
						helper.setTo(to);
						helper.setSubject("MYPET 펫 시터 합격증");
						helper.setText("펫시터에 합격하신걸 축하드립니다. \r\n 추후에 전화연결 부탁드립니다.", true);
						
						String path = request.getSession().getServletContext().getRealPath("");
						String filePathToBeServed = path + "/upload/petSitter_SUC/"+fileName;
						
						FileSystemResource file = new FileSystemResource(new File(filePathToBeServed));
						helper.addAttachment(fileName, file);

					}
				};
				mailSender.send(preparator);
			}
			
		}
		
		PageVo pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);
		
		List<SitterAppVo> staList = sitterService.getSupportListAll(pageVo);
		
		model.addAttribute("staList", staList);
		
		return "admin/petSitter/mypageADSupport";
	}
	
	// 마이페이지 ADMIN 예약 관리 화면
	@RequestMapping("/mypageADReservationAjaxHtml")
	public String mypageADReservationAjaxHtml(Model model, PageVo pageVo) {
		
		List<SitterResVo> resList = sitterService.getReservationListAll(pageVo);
		
		model.addAttribute("resList", resList);
		
		return "admin/petSitter/mypageADReservation";
	}
	
	// 마이페이지 ADMIN 예약 관리 화면 페이징 처리
	@RequestMapping("/mypageADReservationPageAjaxHtml")
	public String mypageADReservationPageAjaxHtml(PageVo pageVo, Model model) {
		
		int pageSize = pageVo.getPageSize();
		int totalCnt = sitterService.getReservationListCount();
		
		int pageCnt = (int)Math.ceil(((double)totalCnt/pageSize));
		
		model.addAttribute("page", pageVo.getPage());
		model.addAttribute("pageCnt", pageCnt);
		
		return "admin/petSitter/mypageADReservationPage";
	}
	
	// 마이페이지 ADMIN 지원관리 화면
	@RequestMapping("/mypageADSupportAjaxHtml")
	public String mypageADSupportAjaxHtml(Model model, PageVo pageVo) {
		
		List<SitterAppVo> staList = sitterService.getSupportListAll(pageVo);
				
		model.addAttribute("staList", staList);
		
		return "admin/petSitter/mypageADSupport";
	}
	
	// 마이페이지 ADMIN 지원관리 화면
	@RequestMapping("/mypageADSupportPageAjaxHtml")
	public String mypageADSupportPageAjaxHtml(Model model, PageVo pageVo) {
		
		int pageSize = pageVo.getPageSize();
		
		int totalCnt = sitterService.getSupportListCount();
		
		int pageCnt = (int)Math.ceil(((double)totalCnt/pageSize));
		
		model.addAttribute("page", pageVo.getPage());
		model.addAttribute("pageCnt", pageCnt);
		
		return "admin/petSitter/mypageADSupportPage";
	}
	
	// 마이페이지 일반사용자 지원관리 화면 -> 첨부파일 클릭시 다운로드
	@RequestMapping("/supportPDFfileViewer")
	public void supportPDFfileViewer(HttpServletRequest request, @RequestParam("fileName")String fileName, HttpSession session,HttpServletResponse response) throws Exception {
		
		try {
			String path1 = request.getSession().getServletContext().getRealPath("");
            String filePathToBeServed = path1 + "\\upload\\petSitter_SUC\\";
            File fileToDownload = new File(filePathToBeServed+fileName);

            FileInputStream inputStream = new FileInputStream(fileToDownload);
            response.setContentType("application/force-download");
            response.setHeader("Content-Disposition", "attachment; filename="+fileName); 
            IOUtils.copy(inputStream, response.getOutputStream());
            response.flushBuffer();
            inputStream.close();
        } catch (Exception exception){
            System.out.println(exception.getMessage());
        }
		
	}
	
	// 결재성공 화면
	@RequestMapping("/paymentSuccess")
	public String paymentSuccess(Model model, @RequestParam("pay_chk")String pay_chk, @RequestParam("pay_price")int pay_price, @RequestParam("pay_name")String pay_name, @RequestParam("pay_dateStart")String pay_dateStart,
			@RequestParam("pay_dateEnd")String pay_dateEnd, @RequestParam("pay_timeStart")String pay_timeStart, @RequestParam("pay_timeEnd")String pay_timeEnd) {
		
		model.addAttribute("pay_chk", pay_chk);
		model.addAttribute("pay_price", pay_price);
		model.addAttribute("pay_name", pay_name);
		model.addAttribute("pay_dateStart", pay_dateStart);
		model.addAttribute("pay_dateEnd", pay_dateEnd);
		model.addAttribute("pay_timeStart", pay_timeStart);
		model.addAttribute("pay_timeEnd", pay_timeEnd);
		
		return "petSitter/paymentSuccess";
	}
	
	// 관리자 마이페이지 현재날짜 보다 이전날짜 삭제처리
	@RequestMapping("/mypageReservationDelete")
	public String mypageReservationDelete(@RequestParam("date")String date) {
		
		int deleteCnt = sitterService.deleteADReservation(date);
		
		return "admin/petSitter/mypageADReservation";
	}
	
	// 관리자 마이페이지 -> 게시글 관리(후기글)
	@RequestMapping("/mypageADNoticeAjaxHtml")
	public String mypageADNoticeAjaxHtml(Model model, PageVo pageVo) {
		
		Map<String, Object> resultMap = sitterService.getReViewListAll(pageVo);
		
		List<SitterRevVo> reviewListAll = (List<SitterRevVo>) resultMap.get("reviewListAll");
		model.addAttribute("reviewListAll", reviewListAll);
		
		return "admin/petSitter/mypageADNotice";
	}
	
	// 관리자 마이페이지 -> 게시글 관리(후기글) 페이징 처리
	@RequestMapping("/mypageADNoticePageAjaxHtml")
	public String mypageADNoticePageAjaxHtml(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = sitterService.getReViewListAll(pageVo);
		
		List<SitterRevVo> reviewListAll = (List<SitterRevVo>) resultMap.get("reviewListAll");
		int pageCnt = (int) resultMap.get("pageCnt");
		
		model.addAttribute("reviewListAll", reviewListAll);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("page", pageVo.getPage());
		
		return "admin/petSitter/mypageADNoticePage";
	}
	
	// 관리자 마이페이지 -> 게시글 관리(후기글) 삭제 처리
	@RequestMapping("/mypageDeleteReview")
	public String mypageDeleteReview(@RequestParam("stv_id")String stv_id, Model model, PageVo pageVo) {
		
		String[] stvId = stv_id.split(" ");
		
		for(int i=0; i<stvId.length; i++) {
			int deleteCnt = sitterService.deleteReview(stvId[i]);
		}
		
		Map<String, Object> resultMap = sitterService.getReViewListAll(pageVo);
		
		List<SitterRevVo> reviewListAll = (List<SitterRevVo>) resultMap.get("reviewListAll");
		model.addAttribute("reviewListAll", reviewListAll);
		
		return "admin/petSitter/mypageADNotice";
	}
	
	// 관리자 마이페이지 -> 게시글 관리(펫시터 집에 맡기기)
	@RequestMapping("/mypageSitterToAjaxHtml")
	public String mypageSitterToAjaxHtml(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = sitterService.getPetSitterToListAll(pageVo);
		
		List<PetSitterVo> petSitterToListAll = (List<PetSitterVo>) resultMap.get("petSitterToListAll");
		model.addAttribute("petSitterToListAll", petSitterToListAll);
		
		return "admin/petSitter/mypageADSitterTo";
	}
	
	// 관리자 마이페이지 -> 게시글 관리(펫시터 집에 맡기기) 페이징 처리
	@RequestMapping("/mypageSitterToPageAjaxHtml")
	public String mypageSitterToPageAjaxHtml(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = sitterService.getPetSitterToListAll(pageVo);
		
		List<SitterRevVo> petSitterToListAll = (List<SitterRevVo>) resultMap.get("petSitterToListAll");
		int pageCnt = (int) resultMap.get("pageCnt");
		
		model.addAttribute("petSitterToListAll", petSitterToListAll);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("page", pageVo.getPage());
		
		return "admin/petSitter/mypageADSitterPage";
	}
	
	// 관리자 마이페이지 -> 게시글 관리(펫시터 집에 맡기기) 삭제 처리
	@RequestMapping("/mypageDeleteSitterTo")
	public String mypageDeleteSitterTo(PageVo pageVo, Model model, @RequestParam("pst_id")String pst_id) {
		
		String[] pstId = pst_id.split(" ");
		for(int i=0; i<pstId.length; i++) {
			int deleteCnt = sitterService.deleteSitterTo(pstId[i]);
		}
		
		Map<String, Object> resultMap = sitterService.getPetSitterToListAll(pageVo);
		
		List<PetSitterVo> petSitterToListAll = (List<PetSitterVo>) resultMap.get("petSitterToListAll");
		model.addAttribute("petSitterToListAll", petSitterToListAll);
		
		return "admin/petSitter/mypageADSitterTo";
	}
	
	// 관리자 마이페이지 -> 반려동물 관리
	@RequestMapping("/mypagePetListAll")
	public String mypagePetListAll(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = sitterService.getPetListAll(pageVo);
		
		List<SitterRevVo> petListAll = (List<SitterRevVo>) resultMap.get("petListAll");
		
		model.addAttribute("petListAll", petListAll);
		
		return "admin/petSitter/mypageADPet";
	}
	
	// 관리자 마이페이지 -> 반려동물 관리 페이징 처리
	@RequestMapping("/mypagePetListAllPage")
	public String mypagePetListAllPage(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = sitterService.getPetListAll(pageVo);
		
		List<SitterRevVo> petListAll = (List<SitterRevVo>) resultMap.get("petListAll");
		int pageCnt = (int) resultMap.get("pageCnt");
		
		model.addAttribute("petListAll", petListAll);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("page", pageVo.getPage());
		
		return "admin/petSitter/mypageADPetPage";
	}
	
	// 관리자 마이페이지 -> 반려동물 관리(반려동물) 삭제처리
	@RequestMapping("/mypageDeletePet")
	public String mypageDeletePet(@RequestParam("myp_id")String myp_id, PageVo pageVo, Model model) {
		
		String[] mypId = myp_id.split(" ");
		
		for(int i=0; i<mypId.length; i++) {
			int deleteCnt = sitterService.deleteMypet(mypId[i]);
		}
		
		Map<String, Object> resultMap = sitterService.getPetListAll(pageVo);
		
		List<SitterRevVo> petListAll = (List<SitterRevVo>) resultMap.get("petListAll");
		
		model.addAttribute("petListAll", petListAll);
		
		return "admin/petSitter/mypageADPet";
	}
}
