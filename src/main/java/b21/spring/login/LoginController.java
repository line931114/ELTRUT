package b21.spring.login;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.eltrut.CommandMap;
import b21.spring.join.JoinService;

@Controller
public class LoginController {

	@Resource(name="loginService")
	private LoginService loginService;
	
	@Resource(name="joinService")
	private JoinService joinService;
	
	@RequestMapping(value="/loginForm")
	public ModelAndView loginForm(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> chk = commandMap.getMap();	      
		
		mav.addObject("message",chk.get("message"));
		mav.setViewName("loginForm");
		return mav;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	   public ModelAndView loginComplete(CommandMap commandMap, HttpServletRequest request) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      
	      HttpSession session = request.getSession();
	      
	      System.out.println("아이디" + commandMap.get("MEMBER_ID"));
	      
	      Map<String, Object> chk = loginService.login(commandMap.getMap());
	      
	      
	      if (chk == null) {	//아이디 값이 없으면
	         mv.setViewName("loginForm");
	         mv.addObject("message", "해당 아이디가 없습니다.");
	         return mv;
	      } else {	//아이디 값이 있으면
	    	  								//비밀번호 1 = DB에 저장된 해당 아이디 비밀번호,		비밀번호 2 = 로그인시 회원이 입력한 비밀번호 
	         System.out.println("비밀번호 1 : " + chk.get("MEMBER_PASSWORD") + "\n비밀번호 2 : " + commandMap.get("MEMBER_PASSWORD"));
	         System.out.println("chk: " + chk);
	         System.out.println("admin: " + chk.get("MEMBER_ADMIN"));
	         				         
	         //틀렸을때
	         if (!String.valueOf(chk.get("MEMBER_PASSWORD")).equals(commandMap.get("MEMBER_PASSWORD"))) {
	        	 	mv.setViewName("loginForm");
		            mv.addObject("message", "비밀번호를 확인해 주세요.");
		            return mv;
	        
	         } else {	//멤버 비밀번호가 입력한 비밀번호 값이 같으면
	        	             
		            session.setAttribute("MEMBER_ID", commandMap.get("MEMBER_ID"));	//세션에 아이디를 넣어라
		            mv.addObject("MEMBER", chk);	//
		            //수정
		            if ( String.valueOf(chk.get("MEMBER_ADMIN")).equals("1")) { //관리자일떄
		            	 mv.setViewName("redirect:/admin");
		            	 return mv;
			        	 
		}
		            	            
		            //일반회원일때
		            
		            mv.setViewName("redirect:/main");
		            session.setAttribute("MEMBER_NAME", chk.get("MEMBER_NAME"));
		            session.setAttribute("MEMBER_NUMBER", chk.get("MEMBER_NUMBER"));
		            session.setAttribute("MEMBER_PHONE", chk.get("MEMBER_PHONE"));
		            session.setAttribute("MEMBER_EMAIL", chk.get("MEMBER_EMAIL"));
		            session.setAttribute("MEMBER_ADMIN", chk.get("MEMBER_ADMIN"));

		            return mv;
		         }
	      }
	}
	 
	
	@RequestMapping(value="/kakaoLogin")
	public ModelAndView kakaoLogin(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		String user_email=request.getParameter("user_email");
		System.out.println(user_email);
		int check = loginService.checkMember(user_email);
		if(check==0) {
			mv.addObject("user_email",user_email);
			mv.setViewName("kakaoJoin");
			return mv;
		}else if(check==1) {
		Map<String, Object> kakao = loginService.kakaoLogin(user_email);
		System.out.println(kakao);
		HttpSession session = request.getSession();
	      if(kakao ==null) {
	    	  mv.setViewName("loginForm");
		      mv.addObject("message", "해당 아이디가 없습니다.");
		      return mv;
	      }else {
	    	  	session.setAttribute("MEMBER_ID",kakao.get("MEMBER_ID"));	//세션에 아이디를 넣어라
	    	  	mv.addObject("MEMBER", kakao);
	    	  	mv.setViewName("redirect:/main");
	            session.setAttribute("MEMBER_NAME", kakao.get("MEMBER_NAME"));
	            session.setAttribute("MEMBER_NUMBER", kakao.get("MEMBER_NUMBER"));
	            session.setAttribute("MEMBER_PHONE", kakao.get("MEMBER_PHONE"));
	            session.setAttribute("MEMBER_EMAIL", kakao.get("MEMBER_EMAIL"));
	            session.setAttribute("MEMBER_ADMIN", kakao.get("MEMBER_ADMIN"));

	            return mv;
	      }
	      } return mv;
	}
	
	
	   @RequestMapping(value = "/logout")		//로그아웃
	   public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) {
	      HttpSession session = request.getSession(false);
	      if (session != null)
	         session.invalidate();
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("redirect:/main");
	      return mv;
	   }
	   
	   @RequestMapping(value="/findForm")
		public ModelAndView findForm(HttpServletRequest request, CommandMap commandMap) throws Exception {
		 	   ModelAndView mav = new ModelAndView();
			mav.setViewName("findForm");
			return mav;
		}
	   
	   @RequestMapping(value="/findForm1", method = RequestMethod.POST )
		public ModelAndView findForm1(HttpServletRequest request, CommandMap commandMap) throws Exception {
		   ModelAndView mav = new ModelAndView();
		   Map<String, Object> memberMap=new HashMap<String, Object>();
		   memberMap=commandMap.getMap();
		   
		   Map<String, Object> chk = loginService.findFail0(memberMap);
		      if (chk == null) {	//아이디 값이 없으면
		         mav.setViewName("findForm");
		         mav.addObject("message", "조회된 정보가 없습니다. 다시 입력해주세요.");
		         return mav;
		      }else {
		   
		   Map<String, Object> findId = loginService.findId(memberMap);

		   mav.addObject("findId", findId);
		   mav.setViewName("findForm1");
		   return mav;
		      }
		}
	   
	   @RequestMapping(value="/findForm2")
		public ModelAndView findForm2(HttpServletRequest request, CommandMap commandMap) throws Exception {
		 	   ModelAndView mav = new ModelAndView();
			mav.setViewName("findForm2");
			return mav;
		}
	   
	   @RequestMapping(value="/findForm3", method = RequestMethod.POST )
		public ModelAndView findForm3(HttpServletRequest request, CommandMap commandMap) throws Exception {
		   ModelAndView mav = new ModelAndView();
		   Map<String, Object> memberMap=new HashMap<String, Object>();
		   memberMap=commandMap.getMap();
		   
		   Map<String, Object> chk = loginService.findFail(memberMap);
		      if (chk == null) {	//아이디 값이 없으면
		         mav.setViewName("findForm2");
		         mav.addObject("message", "조회된 정보가 없습니다. 다시 입력해주세요.");
		         return mav;
		      }else {
				   Map<String, Object> findPw = loginService.findPw(memberMap);

				   mav.addObject("findPw", findPw);
				   mav.setViewName("findForm3");
				   return mav;	
		      }
		   
		}	   	   
	}