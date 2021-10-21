package b21.spring.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.eltrut.CommandMap;
@Controller
public class MainController {

	@Resource(name="MainService")
	private MainService mainService;
	
//	@RequestMapping()
//	public ModelAndView move(CommandMap commandMap,HttpServletRequest request) throws Exception {
//		ModelAndView mav = new ModelAndView();
//		HttpSession session=request.getSession();
//		String MEMBER_ID=(String) session.getAttribute("MEMBER_ID");
//		if(MEMBER_ID==null) {
//			mav.addObject("MEMBER_ID",null);
//		}
//		else {
//			System.out.println("***********************************************\n"+MEMBER_ID);
//			mav.addObject("MEMBER_ID",MEMBER_ID);
//			commandMap.put("MEMBER_ID", MEMBER_ID);
//			Map<String,Object> header_basket=mainService.header_baskets(commandMap.getMap());
//			mav.addObject("header_basket",header_basket);
//		}
//		mav.setViewName("main");
//		System.out.println("******************************************************************************\n");
//		return mav;
//		
//	}
	
	
	@RequestMapping("/main")
	public ModelAndView main(CommandMap commandMap,HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<Map<String,Object>>goods = mainService.goodsList(commandMap.getMap());
		mav.setViewName("main");
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
	
	@RequestMapping(value="/main", method=RequestMethod.POST)
	public ModelAndView main1(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Map<String,Object>>goods = mainService.search(commandMap.getMap(),request);
		mv.setViewName("main");
		mv.addObject("goods", goods);
		
		
		return mv;
	}
	
	
	
	
}
