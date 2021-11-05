package b21.spring.adminOrder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.eltrut.CommandMap;
import b21.spring.paging.Paging;

@Controller
public class AdminOrderController {


	@Resource(name = "adminOrderService")
	private AdminOrderService adminOrderService;

	// 페이징 변수
	private int searchNum;
	private String isSearch;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 20;
	private int blockPage = 10;
	private String pagingHtml;
	private Paging page;

	// 주문 리스트
	@RequestMapping(value = "orderList")
	public ModelAndView orderList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("orderList");

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")
				|| request.getParameter("currentPage").equals("null")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<Map<String, Object>> orderList = adminOrderService.allOrderList(commandMap.getMap());

		Map<String, Object> isSearchMap;

		if (request.getParameterMap().get("isSearch") != null && request.getParameterMap().get("isSearch") != "") {
			System.out.println("서치페이징");
			isSearch = request.getParameter("isSearch");
			isSearchMap = new HashMap<String, Object>();
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			isSearchMap.put("isSearch", isSearch);

			if (searchNum == 0)//주문번호로 검색
				orderList = adminOrderService.adminOrderSearch0(isSearchMap);
			else if (searchNum == 1)// 아이디로 검색
				orderList = adminOrderService.adminOrderSearch1(isSearchMap);
			else if (searchNum == 2)// 상품명으로 검색
				orderList = adminOrderService.adminOrderSearch2(isSearchMap);
			else if (searchNum == 3)// 결제상태로 검색
				orderList = adminOrderService.adminOrderSearch3(isSearchMap);
			else if (searchNum == 4)// 주문상태로 검색
				orderList = adminOrderService.adminOrderSearch4(isSearchMap);
			else
				orderList = adminOrderService.allOrderList(commandMap.getMap());

			totalCount = orderList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "orderList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			orderList = orderList.subList(page.getStartCount(), lastCount);

			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("orderList", orderList);
			mv.setViewName("orderList");
			return mv;
		}

		totalCount = orderList.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "orderList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		orderList = orderList.subList(page.getStartCount(), lastCount);

		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("orderList", orderList);

		return mv;
	}


	// 주문 상세보기
	@RequestMapping(value = "adminOrderDetail")
	public ModelAndView orderDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> orderDetail = new ArrayList<Map<String, Object>>();

		orderDetail = adminOrderService.orderDetail(commandMap.getMap());
		mv.addObject("orderDetail", orderDetail);
		mv.addObject("size", orderDetail.size());
		mv.addObject("orderBasic", orderDetail.get(0));

		/*
		 * Map<String, Object> confirmCancel = new HashMap<String, Object>();
		 * confirmCancel = adminOrderService.confirmCancel(commandMap.getMap()); if
		 * (confirmCancel != null) { mv.addObject("orderCancel", confirmCancel); }
		 */

		mv.setViewName("adminOrderDetail");
		return mv;
	}

	

	

	// adminorderupdate
	@RequestMapping(value="adminOrderUpdate")
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
//		//결제상태
//		adminOrderService.updateGoodsPayState(commandMap.getMap());
//		//배송상태
//		adminOrderService.updateDeliveryState(commandMap.getMap());
		System.out.println(commandMap.getMap());
		Map<String, Object> orderList = adminOrderService.adminOrderUpdate(commandMap.getMap());
		mv.addObject("order", orderList);
		mv.setViewName("adminOrderUpdate");
		return mv;
	}
	
	// adminorderDetail / mv.adminorderList 
	@RequestMapping(value = "adminOrderUpdate",method = RequestMethod.POST )
	public ModelAndView orderDetail1(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(commandMap.getMap());
		adminOrderService.updateGoodsPayState(commandMap.getMap());
		mv.setViewName("redirect:/orderList");
		return mv;
	// detail수정누름 -> 업데이트 폼 에서 수정 -> dao -> service -> serviceimpl -> controller -> adminorderupdate 쿼리작업 해서. 된걸 -> redirect 보내줌. 
	}
	
}