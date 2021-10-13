package b21.spring.join;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		System.out.println("step1");
		return mv;
	}
	
	@RequestMapping(value="/joinComplete", method=RequestMethod.POST)
	public ModelAndView joinComplete(CommandMap commandMap, HttpServletRequest request)throws Exception{
		System.out.println("여기까지는 되니?");
		ModelAndView mv = new ModelAndView();
		Map<String, Object> memberMap=new HashMap<String, Object>();
		memberMap=commandMap.getMap();
		System.out.println(memberMap);
		joinService.insertMember(memberMap, request);
		mv.setViewName("joinComplete");
		
		return mv;
	}
}
