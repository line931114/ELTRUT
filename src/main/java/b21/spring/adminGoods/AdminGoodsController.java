package b21.spring.adminGoods;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.sound.midi.SysexMessage;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.adminGoods.AdminGoodsService;
import b21.spring.eltrut.CommandMap;
import b21.spring.paging.Paging;

@Controller
public class AdminGoodsController {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "adminGoodsService")
	private AdminGoodsService adminGoodsService;
	
	//페이징 변수
		private int searchNum;
		private String isSearch;
		
		private int currentPage = 1;
		private int totalCount;
		private int blockCount = 20;
		private int blockPage = 10;
		private String pagingHtml;
		private Paging page;
	
	// Goods 목록보기
	@RequestMapping(value="/adminGoods/adminGoodsList")
	public ModelAndView adminGoodsList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		ModelAndView mv = new ModelAndView("admin/goods/adminGoodsList");

		List<Map<String, Object>> adminGoodsList = adminGoodsService.adminGoodsList(commandMap.getMap());
		
		if(request.getParameter("isSearch") != null) {
			isSearch = request.getParameter("isSearch");
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum == 0) //상품이름
				adminGoodsList = adminGoodsService.adminGoodsSearch0(isSearch);
			else if(searchNum == 1) // 글번호
				adminGoodsList = adminGoodsService.adminGoodsSearch1(isSearch);
			else if(searchNum == 2) // 카테고리
				adminGoodsList = adminGoodsService.adminGoodsSearch2(isSearch);
			else if(searchNum == 3) // 재고 0인 상품
				adminGoodsList = adminGoodsService.adminGoodsSearch3(isSearch);
			else if(searchNum == 4) // 판매량 많은 순 정렬
				adminGoodsList = adminGoodsService.adminGoodsSearch4(isSearch);
			else if(searchNum == 5) // 조회수 많은 순 정렬
				adminGoodsList = adminGoodsService.adminGoodsSearch5(isSearch);
			else
				adminGoodsList = adminGoodsService.adminGoodsList(commandMap.getMap());
			
			totalCount = adminGoodsList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminGoodsList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			adminGoodsList = adminGoodsList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("adminGoodsList", adminGoodsList);
			mv.setViewName("adminGoodsList");
			return mv;
		}
		
		totalCount = adminGoodsList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminGoodsList");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		adminGoodsList = adminGoodsList.subList(page.getStartCount(), lastCount);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		
		Calendar today = Calendar.getInstance();
		Date d = new Date(today.getTimeInMillis());

		

		mv.addObject("adminGoodsList", adminGoodsList);
		Integer count = adminGoodsService.goodsCount();
		int a = (int) count;
		mv.addObject("count", a);

		return mv;
	}

	
	// 상품 등록폼으로 이동
		@RequestMapping(value = "/adminGoods/adminGoodsInsertForm")
		public ModelAndView adminGoodsInsertForm() {

			ModelAndView mv = new ModelAndView();
			mv.setViewName("admin/goods/adminInsertGoods");

			return mv;
		}

		// 상품 등록
		@RequestMapping(value = "/adminGoods/adminGoodsInsert")
		public ModelAndView adminGoodsInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {

			 ModelAndView mv = new ModelAndView("redirect:adminGoodsList");
		      System.out.println(commandMap.getMap());
		      adminGoodsService.insertAdminGoods(commandMap.getMap(), request);

		      return mv;

		}
	
		// 상품 수정폼으로 이동
		@RequestMapping(value = "/adminGoods/goodsModifyForm")
		public ModelAndView goodsModifyForm(CommandMap commandMap) throws Exception {

			ModelAndView mv = new ModelAndView("/admin/goods/adminModifyGoods");

			Map<String, Object> adminGoodsDetail = adminGoodsService.modifyGoodsForm(commandMap.getMap());
			mv.addObject("adminGoodsDetail", adminGoodsDetail);
			Map<String, Object> adminGoodsBasic = (Map<String, Object>) adminGoodsDetail.get(0);
			System.out.println("mv"+mv);
			System.out.println("adminGoodsDetail"+adminGoodsDetail);
			System.out.println("adminGoodsBasic"+adminGoodsBasic);
			

			Map<String, Object> goodsImage = adminGoodsService.modifyGoodsFormImage(commandMap.getMap());
			mv.addObject("goodsImage", goodsImage);

			return mv;
		}

		// 상품 수정
		@RequestMapping(value = "/adminGoods/adminGoodsModify")
		public ModelAndView goodsModify(CommandMap commandMap, HttpServletRequest request) throws Exception {

			ModelAndView mv = new ModelAndView("redirect:adminGoodsList");
			System.out.println(commandMap.getMap());

			adminGoodsService.modifyGoods(commandMap.getMap(), request);

			return mv;
		}
		
	
		// 상품 삭제
		@RequestMapping(value = "/adminGoods/adminGoodsDelete")
		public ModelAndView goodsDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
			
			ModelAndView mv = new ModelAndView("redirect:adminGoodsList");
			
			adminGoodsService.deleteGoods(commandMap.getMap());
			
			return mv;
		}
	
}
