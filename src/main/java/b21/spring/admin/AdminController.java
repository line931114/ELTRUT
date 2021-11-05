package b21.spring.admin;

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

@Controller
public class AdminController {
	
	@Resource(name="AdminServicea")
	private AdminService adminService;
	
	@RequestMapping(value = "admin")
	public ModelAndView adminMemberList(CommandMap commandMap, HttpServletRequest request) throws Exception {


		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> cancleList = adminService.allCancelList(commandMap.getMap());
		mv.setViewName("admin");
		mv.addObject("List", cancleList);
			return mv;
		}
	
	
	@RequestMapping(value = "admin" ,method = RequestMethod.POST)
	public ModelAndView adminMemberLis(CommandMap commandMap, HttpServletRequest request) throws Exception {
		System.out.println("**********************"+request.getParameter("cancle_ordernumber"));
		System.out.println("**********************"+request.getParameter("cancle_cat"));

		ModelAndView mv = new ModelAndView();
		 Map<String, Object> chk = adminService.updateCancelList(commandMap.getMap());
		
		
		
		List<Map<String, Object>> cancleList = adminService.allCancelList(commandMap.getMap());
		mv.setViewName("admin");
		mv.addObject("List", cancleList);
		
	
			return mv;
		}
	
	
	}
	              
	