package b21.spring.join;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.eltrut.CommandMap;

@Controller
public class JoinController {

	
	@Resource(name="joinService")
	private JoinService joinService;
	
	@RequestMapping(value="/joinStep1")
	public ModelAndView joinStep1() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("joinStep1");
		return mv;
	}
	
	@RequestMapping(value="/agreement")
	public ModelAndView agreement() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("agreement");
		return mav;
	}
	
	@RequestMapping(value="/joinComplete", method=RequestMethod.POST)
	public ModelAndView joinComplete(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String, Object> memberMap=new HashMap<String, Object>();
		memberMap=commandMap.getMap();
		System.out.println(memberMap);
		joinService.insertMember(memberMap, request);
		mv.setViewName("loginForm");
		mv.addObject("message", "회원가입에 성공했습니다!");
		
		return mv;
	}

	@RequestMapping(value="idCheckForm")
	public ModelAndView idCheckForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("idCheckForm");
		return mav;
	}
	
	
	@RequestMapping(value="/checkId")
	@ResponseBody
	public ModelAndView checkId(HttpServletRequest request, CommandMap commandMap) throws Exception{
		ModelAndView mav = new ModelAndView();
		String checkId= (request.getParameter("checkId") == null)?"":request.getParameter("checkId");
		int idCount = joinService.checkId(checkId);
		
			mav.setViewName("checkId");
			mav.addObject("idCount", idCount);
			mav.addObject("checkId", checkId);
		
			
			return mav;
		}
	}

