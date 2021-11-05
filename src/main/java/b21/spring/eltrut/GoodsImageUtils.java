package b21.spring.eltrut;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("goodsImageUtils")
public class GoodsImageUtils {

   private static final String filePath =  "C:\\java\\stsApp\\ELTRUT\\src\\main\\webapp\\file\\goodsFile\\";
   private static final String filePath2 = "C:\\java\\maven-app\\ELTRUT\\src\\main\\webapp\\file\\noticeFile\\";
   private static final String filePath3 = "C:\\java\\maven-app\\ELTRUT\\src\\main\\webapp\\file\\faqFile\\";
   private static final String filePath4 = "C:\\java\\maven-app\\ELTRUT\\src\\main\\webapp\\file\\reviewFile\\";
   private static final String filePath5 = "C:\\java\\maven-app\\ELTRUT\\src\\main\\webapp\\file\\qnaFile\\";
   
   // 상품 썸네일 이미지 등록
   public Map<String, Object> goodsThumbnail(Map<String, Object> map, HttpServletRequest request) throws Exception {

      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

      if (multipartHttpServletRequest.getFile("GOODS_THUMBNAIL") != null) {
         MultipartFile file = multipartHttpServletRequest.getFile("GOODS_THUMBNAIL");
         System.out.println(file);
         String fileName = "Thumbnail_" + map.get("GOODS_NUMBER").toString();

         String IMAGEExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
         
         File file2 = new File(filePath);
         if (file2.exists() == false) {
            file2.mkdirs(); // 폴더가 존재하지 않으면 폴더 생성
         }

         
         File uploadFile = new File(filePath + fileName + IMAGEExtension);

         try {
            file.transferTo(uploadFile);
         } catch (Exception e) {

         }
         map.put("GOODS_THUMBNAIL", fileName + IMAGEExtension);
      }
      return map;
   }

   // 상품이미지 등록
   public Map<String, Object> parseInsertFileInfo1(Map<String, Object> map, HttpServletRequest request)
         throws Exception {

	   MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

	      if (multipartHttpServletRequest.getFile("GOODS_IMAGE_1") != null) {
	         MultipartFile file = multipartHttpServletRequest.getFile("GOODS_IMAGE_1");
	         String fileName = "GOODS_IMAGE_1" + map.get("GOODS_NUMBER").toString();

	         String IMAGEExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
	         
	         File file2 = new File(filePath);
	         if (file2.exists() == false) {
	            file2.mkdirs(); // 폴더가 존재하지 않으면 폴더 생성
	         }

	         
	         File uploadFile = new File(filePath + fileName + IMAGEExtension);

	         try {
	            file.transferTo(uploadFile);
	         } catch (Exception e) {

	         }
	         map.put("GOODS_IMAGE_1", fileName + IMAGEExtension);
	      }
	      return map;
	   }
   
   //상품이미지2
   public Map<String, Object> parseInsertFileInfo2(Map<String, Object> map, HttpServletRequest request)
		   throws Exception {
	   
	   MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
	   
	   if (multipartHttpServletRequest.getFile("GOODS_IMAGE_2") != null) {
		   MultipartFile file = multipartHttpServletRequest.getFile("GOODS_IMAGE_2");
		   String fileName = "GOODS_IMAGE_2" + map.get("GOODS_NUMBER").toString();
		   
		   String IMAGEExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		   
		   File file2 = new File(filePath);
		   if (file2.exists() == false) {
			   file2.mkdirs(); // 폴더가 존재하지 않으면 폴더 생성
		   }
		   
		   
		   File uploadFile = new File(filePath + fileName + IMAGEExtension);
		   
		   try {
			   file.transferTo(uploadFile);
		   } catch (Exception e) {
			   
		   }
		   map.put("GOODS_IMAGE_2", fileName + IMAGEExtension);
	   }
	   return map;
   }
   
   
   
   
   // 썸네일 이미지 수정
   public Map<String, Object> parseUpdateThumbImage(Map<String, Object> map, HttpServletRequest request)
         throws Exception {

      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
      MultipartFile file = multipartHttpServletRequest.getFile("GOODS_THUMBNAIL");

      String fileName = "Thumbnail_" + map.get("GOODS_NUMBER").toString();

      String IMAGEExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

      File uploadFile = new File(filePath + fileName + IMAGEExtension);

      if (map.get("ORIIGINAL_THUMBNAIL") != null) {
         String orgFileName = (String) map.get("ORIGINAL_THUMBNAIL");
         File removeFile = new File(filePath + orgFileName);
         removeFile.delete();
      }

      try {
         file.transferTo(uploadFile);
      } catch (Exception e) {
      }

      map.put("GOODS_THUMBNAIL", fileName + IMAGEExtension);

      System.out.println("썸네일이미지 수정완료");
      return map;
   }

   // 이미지 수정
   public List<Map<String, Object>> parseUpdateImages(Map<String, Object> map, HttpServletRequest request)
         throws Exception {

      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
      String IMAGEExtension = null;

      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
      Map<String, Object> listMap = null;
      MultipartFile multipartFile = null;

      File file = new File(filePath);
      if (file.exists() == false) {
         file.mkdirs(); // 폴더가 존재하지 않으면 폴더 생성
      }

      String[] orgImage = request.getParameterValues("ORIGINAL_IMAGE");
      // System.out.println("기존 이미지 배열 : " + orgImage);
      // 기존파일 수정 및 삭제
      for (String a : orgImage) { // 전송된 기존파일 정보가 있으면
         if (request.getParameter(a) != null) { //
            // 기존파일이 수정되었으면 밑의 if문으로들어가고, 아니면 그냥 지나감
            if (multipartHttpServletRequest.getFile("MODIFY_IMAGE_" + a).getSize() > 0) {
               multipartFile = multipartHttpServletRequest.getFile("MODIFY_IMAGE_" + a);

               File removeFile = new File(filePath + a);
               removeFile.delete();

               IMAGEExtension = multipartFile.getOriginalFilename()
                     .substring(multipartFile.getOriginalFilename().lastIndexOf("."));

               file = new File(filePath + a.substring(0, a.lastIndexOf(".")) + IMAGEExtension);
               multipartFile.transferTo(file);

               listMap = new HashMap<String, Object>();
               listMap.put("GOODS_IMAGE_2", a.substring(0, a.lastIndexOf(".")) + IMAGEExtension);
               listMap.put("ORIGINAL_IMAGE", a);

               listMap.put("GOODS_NUMBER", map.get("GOODS_NUMBER"));
               list.add(listMap);
            }
         }
      }
      System.out.println(list.size());
      return list;
   }
   
   // 썸네일이미지 삭제
   public void parseDeleteThumbnail(Map<String, Object> map) throws Exception {

      if (map.get("GOODS_THUMBNAIL") != null) {
         File removeFile = new File(filePath + map.get("GOODS_THUMBNAIL"));
         removeFile.delete();
      }
   }

   // 이미지 삭제
   public void parseDeleteImages(Map<String, Object> map) throws Exception {

      if (map.get("GOODS_IMAGE_2") != null) {
         File removeFile = new File(filePath + map.get("GOODS_IMAGE_2"));
         removeFile.delete();
      }
   }

   
   //리뷰 이미지 삭제
   public void reviewImageDelete(Map<String, Object> map) throws Exception {
      if(map.get("REVIEW_IMAGE") != null) {
         File removeFile = new File(filePath4 + map.get("REVIEW_IMAGE"));
         removeFile.delete();
      }
   }
   
   //QNA 이미지 삭제
   public void qnaImageDelete(Map<String, Object> map) throws Exception {
      if(map.get("CS_IMAGE1") != null) {
         File removeFile = new File(filePath5 + map.get("CS_IMAGE1"));
         removeFile.delete();
      }
   }

   
}