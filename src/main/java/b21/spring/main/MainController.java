package b21.spring.main;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.sql.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.eltrut.CommandMap;
import b21.spring.paging.Paging;
@Controller
public class MainController {

	@Resource(name="MainService")
	private MainService mainService;
	
	
	//페이징 변수
			private int searchNum;
			private String isSearch;
			
			private int currentPage = 1;
			private int totalCount;
			private int blockCount = 20;
			private int blockPage = 10;
			private String pagingHtml;
			private Paging page;
			
	
	@RequestMapping("/main0")
	public ModelAndView main0(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<Map<String,Object>>goods = mainService.goodsList(commandMap.getMap());
		
	
		
		System.out.println(goods);
		
		
		mav.setViewName("main0");
		mav.addObject("goods", goods);
		

		HttpSession session=request.getSession();
		String MEMBER_ID=(String) session.getAttribute("MEMBER_ID");
		if(MEMBER_ID==null) {
			mav.addObject("MEMBER_ID",null);
		}
		else {
			System.out.println("***********************************************\n"+MEMBER_ID);
			mav.addObject("MEMBER_ID",MEMBER_ID);
			commandMap.put("MEMBER_ID", MEMBER_ID);
			Map<String,Object> header_basket=mainService.header_baskets(commandMap.getMap());
			mav.addObject("header_basket",header_basket);
		}
		
		
		return mav;
		
	}
	
	
	
	
	@RequestMapping("/main")
	public ModelAndView main(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("main");
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() //
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		


		List<Map<String, Object>> adminGoodsList = mainService.adminGoodsList(commandMap.getMap());
		
		if(request.getParameter("isSearch") != null) {
			isSearch = request.getParameter("isSearch");
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum == 0) {
				adminGoodsList = mainService.adminGoodsSearch2(isSearch);
				mav.addObject("goods", adminGoodsList);
			}else
				adminGoodsList = mainService.adminGoodsList(commandMap.getMap());
				System.out.println("---------------------------");
				
				mav.addObject("goods", adminGoodsList);
			
			totalCount = adminGoodsList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminGoodsList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			adminGoodsList = adminGoodsList.subList(page.getStartCount(), lastCount);
			
			mav.addObject("isSearch", isSearch);	//
			System.out.println("00000000000000000000000000000000");
			System.out.println(isSearch);
			
			
		
		}
		else {
			adminGoodsList = mainService.adminGoodsList(commandMap.getMap());
			System.out.println("---------------------------");
			
			mav.addObject("goods", adminGoodsList);
		}
//		List<Map<String,Object>>goods = mainService.goodsList(commandMap.getMap());
//		
//	
//		
//		System.out.println(goods);
//		
//		
//		mav.setViewName("main");
//		mav.addObject("goods", goods);
		
		
		
		HttpSession session=request.getSession();
		String MEMBER_ID=(String) session.getAttribute("MEMBER_ID");
		if(MEMBER_ID==null) {
			mav.addObject("MEMBER_ID",null);
		}
		
		else {
			System.out.println("***********************************************\n"+MEMBER_ID);
			mav.addObject("MEMBER_ID",MEMBER_ID);
			commandMap.put("MEMBER_ID", MEMBER_ID);
			Map<String,Object> header_basket=mainService.header_baskets(commandMap.getMap());
			mav.addObject("header_basket",header_basket);
		}
		
	
		return mav;
	}
	@RequestMapping(value="/main", method=RequestMethod.POST)
	public ModelAndView main1(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String,Object>>goods = mainService.search(commandMap.getMap(),request);
		mv.setViewName("main");
		mv.addObject("goods", goods);
		
		
		return mv;
	}
	
	
	//main_footer 에서 사용되는 회사정책, Function
	
	@RequestMapping(value="/privacy")
	public ModelAndView footer0(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("footerFunction/privacy");
		return mv;
	}
	
	@RequestMapping(value="/Aboutus")
	public ModelAndView Aboutus(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Aboutus");
		return mv;
	}
	@RequestMapping(value="/help")
	public ModelAndView help(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("help");
		return mv;
	}
	@RequestMapping(value="/terms")
	public ModelAndView terms(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("footerFunction/terms");
		return mv;
	}
	
	//main_footer에서 이동되는 follow us
	
	@RequestMapping(value="/Kwangho")
	public ModelAndView kwangho(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("footerFunction/eltrut/1_Kwangho");
		return mv;
	}
	@RequestMapping(value="/Hyerim")
	public ModelAndView Hyerim(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("footerFunction/eltrut/2_Hyerim");
		return mv;
	}
	@RequestMapping(value="/Saeyoung")
	public ModelAndView Saeyoung(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("footerFunction/eltrut/3_Saeyoung");
		return mv;
	}
	@RequestMapping(value="/Suwan")
	public ModelAndView Suwan(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("footerFunction/eltrut/4_Suwan");
		return mv;
	}
	@RequestMapping(value="/Jisu")
	public ModelAndView Jisu(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("footerFunction/eltrut/5_Jisu");
		return mv;
	}
	@RequestMapping(value="/WonCheol")
	public ModelAndView Woncheol(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("footerFunction/eltrut/6_Woncheol");
		return mv;
	}
	@RequestMapping(value="INFO")
	public ModelAndView INFO(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("footerFunction/eltrut/INFO");
		return mv;
	}

	
}
