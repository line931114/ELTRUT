package b21.spring.adminQna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.adminQna.AdminQnaService;
import b21.spring.eltrut.CommandMap;

@Controller
public class AdminQnaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "AdminQnaService")
	private AdminQnaService adminQnaService;
	
	
	// QNA 목록보기
	@RequestMapping(value="/adminQna/adminQnaList")
    public ModelAndView openQnaBoardList(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/admin/qna/adminQNAList");
    	
    	List<Map<String,Object>> adminQnaList = adminQnaService.adminQnaList(commandMap);
    	mv.addObject("list", adminQnaList);
    	
    	return mv;
    }
	
	
	// QNA 상세보기
		@RequestMapping(value = "/adminQna/adminQnaDetail")
		public ModelAndView adminQnaDetail(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView();

			Map<String, Object> qnaDetail = adminQnaService.adminQnaDetail(commandMap.getMap());
			
			mv.addObject("qnaDetail", qnaDetail);
			mv.setViewName("/admin/qna/adminQNADetail");
			
			return mv;
		}
	
		
		// Q&A 답변달기 폼
		@RequestMapping(value = "/adminQna/adminQnaReplyForm")
		public ModelAndView adminQnaReplyForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView();
			
			if (request.getParameter("CS_NUMBER") != null) {
				Map<String, Object> qnaDetail = adminQnaService.adminQnaDetail(commandMap.getMap());
				mv.addObject("qnaDetail", qnaDetail);
			}
			mv.setViewName("qnaReply");
			return mv;
		}
	
		
		// Q&A 답변 달기
		@RequestMapping(value = "/adminQna/adminQnaReply")
		public ModelAndView adminQnaReply(CommandMap commandMap, HttpServletRequest request) throws Exception {
			ModelAndView mv = new ModelAndView();
			
			adminQnaService.insertQnaReply(commandMap.getMap());
			mv.setViewName("redirect:/admin/qna/adminQnaDetail?CS_NUMBER=" + commandMap.get("CS_NUMBER"));
			
			return mv;
		}

	
	
}
