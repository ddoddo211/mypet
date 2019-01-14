package kr.co.mypet.shopping.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
import kr.co.mypet.common.model.PageVo;
import kr.co.mypet.shopping.model.DivisionVo;
import kr.co.mypet.shopping.model.ProdVo;
import kr.co.mypet.shopping.model.ShopNoticeVo;
import kr.co.mypet.shopping.service.ShoppingServiceInf;
import kr.co.mypet.sitter.model.SitterAppVo;
import kr.co.mypet.util.StringUtil;

@Controller
@RequestMapping("/shopAdmin")
public class ShopAdminController {
	
	@Resource(name="shoppingService")
	private ShoppingServiceInf shoppingService;
	
	//관리자용 펫샵 메인
	@RequestMapping("/shopAdminMain")
	public String shopAdminMain(Model model) {
		
		List<DivisionVo> aniList = shoppingService.animalList();
		
		model.addAttribute("aniList",aniList);
		
		return "admin/petshop/adminShopMain";
	}
	
	// 펫샵 메인에서 동물을 선택했을 경우 메뉴List 보내주기
	@RequestMapping("/menuSelect")
	public String menuSelect(@RequestParam("dvs_id")String dvs_id,Model model) {
		
		//동물 List
		List<DivisionVo> aniList = shoppingService.animalList();
		//메뉴 List
		List<DivisionVo> menuList = shoppingService.prodMenu(dvs_id);
		
		model.addAttribute("dvs_id",dvs_id);
		model.addAttribute("aniList",aniList);
		model.addAttribute("menuList",menuList);
		
		return "admin/petshop/adminShopMain";
	}
	
	// 펫샵 동물과 메뉴를 선택시 상품List 보내주기
	@RequestMapping("/menuList")
	public String menuList(DivisionVo dvsVo,Model model,PageVo pageVo) {
		
		//동물 List
		List<DivisionVo> aniList = shoppingService.animalList();
		//메뉴 List
		List<DivisionVo> menuList = shoppingService.prodMenu(dvsVo.getDvs_id());
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pageVo",pageVo);
		map.put("dvsVo",dvsVo);
		List<ProdVo> prodList = shoppingService.prodList(map);
		
		int size = shoppingService.prodSize(dvsVo.getDvs_parent());
		int prodSize = (int) Math.ceil((double) size/pageVo.getPageSize());
		
		model.addAttribute("dvs_id",dvsVo.getDvs_id());
		model.addAttribute("dvs_parent",dvsVo.getDvs_parent());
		model.addAttribute("page",pageVo.getPage());
		model.addAttribute("prodSize",prodSize);
		model.addAttribute("aniList",aniList);
		model.addAttribute("menuList",menuList);
		model.addAttribute("prodList",prodList);
		
		return "admin/petshop/adminShopMain";
	}
	
	// 상품 삭제 후 해당 페이지로 이동
	@RequestMapping("/prodDelete")
	public String prodDelete(DivisionVo dvsVo,Model model,PageVo pageVo,@RequestParam("prod_id")String prod_id) {
		
		// 상품 삭제하기
		shoppingService.deleteProd(prod_id);
		
		//동물 List
		List<DivisionVo> aniList = shoppingService.animalList();
		//메뉴 List
		List<DivisionVo> menuList = shoppingService.prodMenu(dvsVo.getDvs_id());
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pageVo",pageVo);
		map.put("dvsVo",dvsVo);
		List<ProdVo> prodList = shoppingService.prodList(map);
		
		int size = shoppingService.prodSize(dvsVo.getDvs_parent());
		int prodSize = (int) Math.ceil((double) size/pageVo.getPageSize());
		
		model.addAttribute("dvs_id",dvsVo.getDvs_id());
		model.addAttribute("dvs_parent",dvsVo.getDvs_parent());
		model.addAttribute("page",pageVo.getPage());
		model.addAttribute("prodSize",prodSize);
		model.addAttribute("aniList",aniList);
		model.addAttribute("menuList",menuList);
		model.addAttribute("prodList",prodList);
		
		return "admin/petshop/adminShopMain";
	}
	
	/**
	* Method : shopAdminEvent
	* 작성자 : pc25
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 : 이벤트관리 화면
	*/
	@RequestMapping("/shopAdminEvent")
	public String shopAdminEvent(Model model) {
		
		List<ShopNoticeVo>snotList =  shoppingService.shopNoticeList();
		
		model.addAttribute("snotList",snotList);
		
		return "admin/petshop/adminShopEvent";
	}
	
	@RequestMapping("/seller")
	public String sellerView(Model model, @RequestParam("page")int page, @RequestParam("pageSize")int pageSize) {
		PageVo pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);
		
		List<SitterAppVo> supportListAll = shoppingService.getSupportListAll(pageVo); 
		
		int totalCnt = shoppingService.getSupportListAllCnt();
		int pageCnt = (int)Math.ceil(((double)totalCnt/pageSize));
		
		model.addAttribute("supportListAll", supportListAll);
		model.addAttribute("pageCnt", pageCnt);
		
		return "/admin/petshop/adminShopSeller";
	}
	
	
	/**
	* Method : eventDel
	* 작성자 : pc25
	* 변경이력 :
	* @param snot_id
	* @param model
	* @return
	* Method 설명 : 이벤트 삭제 (업데이트문)
	*/
	@RequestMapping("/eventDel")
	public String eventDel(@RequestParam("snot_id")String snot_id,Model model) {
		
		shoppingService.shopNoticeDel(snot_id);
		
		List<ShopNoticeVo>snotList =  shoppingService.shopNoticeList();
		
		model.addAttribute("snotList",snotList);
		return "admin/petshop/adminShopEvent";
	}
	
	
	// 이벤트 등록
	@RequestMapping("/eventCre")
	public String eventCre(ShopNoticeVo snotVo,@RequestPart("snotPimg")MultipartFile snotPimg,@RequestPart("snotImg")MultipartFile snotImg
			,HttpServletRequest request,HttpSession session) throws IllegalStateException, IOException {
		
		// 상품 이미지 업로드
		String path1 = request.getSession().getServletContext().getRealPath("");
		String path = path1 +"/shopimg";
		
		String oriFileName = snotPimg.getOriginalFilename();
		String oriFileName2 = snotImg.getOriginalFilename();
		
		//확장자 잘라오기
		String fileExt = StringUtil.getFileExt(oriFileName);
		String fileExt2 = StringUtil.getFileExt(oriFileName2);
		
		String fileName = UUID.randomUUID().toString() + fileExt; // 충돌 방지를 위한 임의의 파일명
		String fileName2 = UUID.randomUUID().toString() + fileExt2;
		
		File file = new File(path + File.separator + fileName);
		File file2 = new File(path + File.separator + fileName2);
		
		snotPimg.transferTo(file);
		snotImg.transferTo(file2);
		
		MemberVo memVo = (MemberVo) session.getAttribute("memVo");
		
		snotVo.setSnot_pimg("/shopimg/"+fileName);
		snotVo.setSnot_img("/shopimg/"+fileName2);
		snotVo.setSnot_mem(memVo.getMem_id());
		snotVo.setSnot_chk(1);
		
		int result = shoppingService.shopNoticeCre(snotVo);
		
		return "redirect:/shopAdmin/shopAdminEvent";
	}
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@RequestMapping("/pdfEmail")
	public String pdfEmail(final HttpServletRequest request, @RequestParam("staId")String staId, @RequestParam("page")String page, @RequestParam("pageSize")String pageSize, Model model,
			@RequestParam("memName")String memName, @RequestParam("staKind")String staKind, @RequestParam("staComp")String staComp, @RequestParam("staNum")String staNum,
			@RequestParam("staMem") final String staMem) throws DocumentException, IOException {
		
		System.out.println("staId : "+staId);
		System.out.println("memName : "+memName);
		System.out.println("staKind : "+staKind);
		System.out.println("staComp : "+staComp);
		System.out.println("staNum : "+staNum);
		System.out.println("staMem : "+staMem);
		System.out.println("page : "+page);
		System.out.println("pageSize : "+pageSize);
		
		String fileName = "";
		String path1 = request.getSession().getServletContext().getRealPath("");
		String dir = path1 + "\\upload\\petShop_SUC";
		fileName = UUID.randomUUID().toString()+".pdf";
		
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
		cb.showText("펫쇼핑몰");
		cb.setTextMatrix(210,517);
		cb.showText(memName);
		cb.setTextMatrix(210,475);
		cb.showText(staKind);
		if(staKind.equals("회사")) {
			cb.setTextMatrix(210,433);
			cb.showText(staComp);
			cb.setTextMatrix(210,391);
			cb.showText(staNum);
		}
		cb.endText();
		
		document.close();
		writer.close();
		
		Map<String, Object> param = new HashMap<>();
		param.put("sta_id", staId);
		param.put("sta_file", fileName);
		
		int updateMem = shoppingService.updateMemeberShop(staMem);
		int updateCnt = shoppingService.updateSupportFile(param);
		
		if(updateCnt != 0 && updateMem != 0) {
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("sjyounghos@naver.com");
					helper.setTo(staMem);
					helper.setSubject("MYPET 펫 쇼핑몰 합격증");
					helper.setText("펫쇼핑몰에 합격하신걸 축하드립니다. \r\n 추후에 전화연결 부탁드립니다.", true);
					
					String path = request.getSession().getServletContext().getRealPath("");
					String filePathToBeServed = path + "/img/petInsurance/contract.jpg";
					
					FileSystemResource file = new FileSystemResource(new File(filePathToBeServed));
					helper.addAttachment("contract.jpg", file);

				}
			};
			mailSender.send(preparator);
		}	
		
		PageVo pageVo = new PageVo();
		pageVo.setPage(Integer.parseInt(page));
		pageVo.setPageSize(Integer.parseInt(pageSize));
		
		List<SitterAppVo> supportListAll = shoppingService.getSupportListAll(pageVo);
		
		int totalCnt = shoppingService.getSupportListAllCnt();
		int pageCnt = (int)Math.ceil(((double)totalCnt/Integer.parseInt(pageSize)));
		
		model.addAttribute("supportListAll", supportListAll);
		model.addAttribute("page", page);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCnt", pageCnt);
		
		return "/admin/petshop/adminShopSeller";
	}
}