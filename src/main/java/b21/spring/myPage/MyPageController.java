package b21.spring.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.eltrut.CommandMap;

@Controller
public class MyPageController {

	@Resource(name="myPageService")
	private MyPageService myPageService;
	
	
	@RequestMapping(value="/myPage")
	public ModelAndView myPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage/myPage");
		return mav;
	}
	
	@RequestMapping(value="/memberInfo")
	public ModelAndView memberInfo(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		Map<String,Object> memberInfo = myPageService.memberInfo(commandMap.getMap());
		 System.out.println(memberInfo);
		 mav.addObject("M",memberInfo);
		mav.setViewName("myPage/memberInfo");
		return mav;
	}
	
	
	@RequestMapping(value="/pwCheck")
	public ModelAndView pwCheck(CommandMap commandMap, HttpServletRequest request) throws Exception {
		  ModelAndView mav = new ModelAndView();
	      mav.setViewName("myPage/pwCheck");
	      return mav;
	}
	
	@RequestMapping(value="/pwCheck", method = RequestMethod.POST)
	public ModelAndView pwCheck1(CommandMap commandMap, HttpServletRequest request) throws Exception {
		  ModelAndView mav = new ModelAndView();
	      
	      HttpSession session = request.getSession();
	      String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
	      mav.addObject("MEMBER_ID",MEMBER_ID);
	      commandMap.put("MEMBER_ID", MEMBER_ID);
	  	
	      System.out.println("아이디" + commandMap.get("MEMBER_ID"));
	      
	      Map<String, Object> chk = myPageService.memberInfo(commandMap.getMap());
	      
	    	  								//비밀번호 1 = DB에 저장된 해당 아이디 비밀번호,		비밀번호 2 = 로그인시 회원이 입력한 비밀번호 
	         System.out.println("비밀번호 1 : " + chk.get("MEMBER_PASSWORD") + "\n비밀번호 2 : " + commandMap.get("MEMBER_PASSWORD"));
	         			//멤버 비밀번호가 입력한 비밀번호 값이 같으면
	         if (String.valueOf(chk.get("MEMBER_PASSWORD")).equals(commandMap.get("MEMBER_PASSWORD"))) {
	        	 mav.addObject("M",chk);
	        	 mav.setViewName("myPage/memberUpdateForm");
	            return mav;
	        
	         } else {	//비밀번호 틀렸을때
	  	        	mav.setViewName("myPage/pwCheck");
	  	            mav.addObject("message", "비밀번호를 확인해 주세요.");
	  	            return mav;
	  	     }
	      
	      
	      }
   
	@RequestMapping(value="memberUpdateForm")
	public ModelAndView memberUpdateForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		Map<String,Object> memberInfo = myPageService.memberInfo(commandMap.getMap());
		 System.out.println(memberInfo);
		 mav.addObject("M",memberInfo);
		
		mav.setViewName("myPage/memberUpdateForm");
		return mav;
	}
	
	@RequestMapping(value="memberUpdateForm", method = RequestMethod.POST)
	public ModelAndView memberUpdateForm1(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		myPageService.memberUpdate(commandMap.getMap());
		
		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		Map<String,Object> memberInfo = myPageService.memberInfo(commandMap.getMap());
		 System.out.println(memberInfo);
		 mav.addObject("M",memberInfo);
		
		
		mav.setViewName("myPage/memberInfo");
		return mav;
	}
	
}
