package b21.spring.adminReview;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.adminReview.AdminReviewService;
import b21.spring.eltrut.CommandMap;
import b21.spring.paging.AdminREVIEWPaging;

@Controller
public class AdminReviewController {

	@Resource(name = "adminReviewService")
	private AdminReviewService adminReviewService;
	
	private int totalCount;
	private int searchNum;
	private Integer scoreNum;
	private Integer repState;
	
	private String isSearch;
	private int currentPage = 1;
	private int blockCount = 10;
	private int blockPage = 10;
	private String pagingHtml;
	private AdminREVIEWPaging page;
	
	// REVIEW 목록
	@RequestMapping(value = "adminReviewList")
	public ModelAndView adminReviewList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() 
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		List<Map<String, Object>> adminReviewList = adminReviewService.reviewList(commandMap.getMap());
		totalCount = adminReviewList.size();
		
		isSearch = request.getParameter("isSearch");
		
		if (isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum").trim());
			isSearch = request.getParameter("isSearch");
			
			if (searchNum == 0) {
				commandMap.put("MEMBER_ID", isSearch);
				adminReviewList = adminReviewService.reviewSearchMemberList(commandMap.getMap());
				totalCount = adminReviewList.size();
			} else if (searchNum == 1) {
				commandMap.put("REVIEW_TITLE", isSearch);
				adminReviewList = adminReviewService.reviewSearchTitleList(commandMap.getMap());
				totalCount = adminReviewList.size();
			}
			
			page = new AdminREVIEWPaging(currentPage, totalCount, blockCount, blockPage, "adminReviewList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			adminReviewList = adminReviewList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("adminReviewList", adminReviewList);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.setViewName("adminReviewList");
			
			return mv;
		}
		
		try {
			scoreNum = Integer.parseInt(request.getParameter("scoreNum"));
			if (scoreNum != null) {
				if (scoreNum == 1) {
					commandMap.put("REVIEW_SCORE", "1");
					adminReviewList = adminReviewService.reviewScoreList(commandMap.getMap());
					totalCount = adminReviewList.size();
				} else if (scoreNum == 2) {
					commandMap.put("REVIEW_SCORE", "2");
					adminReviewList = adminReviewService.reviewScoreList(commandMap.getMap());
					totalCount = adminReviewList.size();
				} else if (scoreNum == 3) {
					commandMap.put("REVIEW_SCORE", "3");
					adminReviewList = adminReviewService.reviewScoreList(commandMap.getMap());
					totalCount = adminReviewList.size();
				} else if (scoreNum == 4) {
					commandMap.put("REVIEW_SCORE", "4");
					adminReviewList = adminReviewService.reviewScoreList(commandMap.getMap());
					totalCount = adminReviewList.size();
				} else if (scoreNum == 5) {
					commandMap.put("REVIEW_SCORE", "5");
					adminReviewList = adminReviewService.reviewScoreList(commandMap.getMap());
					totalCount = adminReviewList.size();
				}
				
				page = new AdminREVIEWPaging(currentPage, totalCount, blockCount, blockPage, "adminReviewList", scoreNum, request);
				pagingHtml = page.getPagingHtml().toString();
				
				int lastCount = totalCount;
				
				if (page.getEndCount() < totalCount)
					lastCount = page.getEndCount() + 1;
				
				adminReviewList = adminReviewList.subList(page.getStartCount(), lastCount);
				
				mv.addObject("scoreNum", scoreNum);
				mv.addObject("pagingHtml", pagingHtml);
				mv.addObject("currentPage", currentPage);
				mv.addObject("adminReviewList", adminReviewList);
				mv.addObject("totalCount", totalCount);
				mv.setViewName("adminReviewList");
				
				return mv;
			}
		} catch (Exception ex) {
			
		}
		
		try {
			repState = Integer.parseInt(request.getParameter("repState"));
			if (repState != null) {
				if (repState == 1) {
					commandMap.put("REVIEW_REPSTATE", "미답변");
					adminReviewList = adminReviewService.reviewRepState(commandMap.getMap());
					totalCount = adminReviewList.size();
				} else if (repState == 2) {
					commandMap.put("REVIEW_REPSTATE", "답변완료");
					adminReviewList = adminReviewService.reviewRepState(commandMap.getMap());
					totalCount = adminReviewList.size();
				} 
			}
			
			page = new AdminREVIEWPaging(currentPage, totalCount, blockCount, blockPage, request, "adminReviewList", repState);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			adminReviewList = adminReviewList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("repState", repState);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("adminReviewList", adminReviewList);
			mv.addObject("totalCount", totalCount);
			mv.setViewName("adminReviewList");
			
			return mv;
		} catch (Exception ex) {
			
		}
		
		
		
		page = new AdminREVIEWPaging(currentPage, totalCount, blockCount, blockPage, "adminReviewList");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		adminReviewList = adminReviewList.subList(page.getStartCount(), lastCount);
		
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		mv.addObject("adminReviewList", adminReviewList);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("adminReviewList");
		
		return mv;
	}
	
	// REVIEW 상세보기
	@RequestMapping(value = "adminReviewDetail")
	public ModelAndView adminReviewDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		Map<String, Object> reviewDetail = adminReviewService.reviewDetail(commandMap.getMap());
		
		mv.addObject("reviewDetail", reviewDetail);
		mv.setViewName("adminReviewDetail");
		
		return mv;
	}
	
	// REVIEW 답변달기 폼
	@RequestMapping(value = "adminReviewReply1")
	public ModelAndView adminReviewReplyForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if (request.getParameter("REVIEW_NUMBER") != null) {
			Map<String, Object> reviewDetail = adminReviewService.reviewDetail(commandMap.getMap());
			mv.addObject("reviewDetail", reviewDetail);
		}
		mv.setViewName("adminReviewReply");
		return mv;
	}
	
	// REVIEW 답변 달기
	@RequestMapping(value = "adminReviewReply", method = RequestMethod.POST)
	public ModelAndView adminReviewReply(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		adminReviewService.updateReviewReplyStep(commandMap.getMap());
		mv.setViewName("redirect:/adminReviewDetail?REVIEW_NUMBER=" + commandMap.get("REVIEW_NUMBER"));
		
		return mv;
	}
	
	// REVIEW 관리자 강제 삭제
	@RequestMapping(value = "/adminReview/ReplyDelete")
	public ModelAndView adminReviewDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String filePath ="C:\\JAVA\\stsApp\\ELTRUT\\src\\main\\webapp\\file\\reviewFile\\";
		String image1 = null;
		
		if (request.getParameter("REVIEW_IMAGE") != null) {
			image1 = request.getParameter("REVIEW_IMAGE");
			
			File imageFile1= new File(filePath + image1);
			
			if (imageFile1.isFile()) {
				imageFile1.delete();
			}
		}
		
		adminReviewService.adminReviewDelete(commandMap.getMap());
		mv.setViewName("redirect:/adminReviewList");
		
		return mv;
	}
	
	// REVIEW 답변 삭제
	@RequestMapping(value = "/adminReview/adminReviewReplyDelete")
	public ModelAndView adminReviewReplyDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(commandMap.getMap());
		adminReviewService.reviewReplyDelete(commandMap.getMap());
		mv.setViewName("redirect:/adminReviewDetail?REVIEW_NUMBER=" + commandMap.get("REVIEW_NUMBER"));
		
		return mv;
	}
}