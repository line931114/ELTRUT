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

@Component("qnaImageUtils")
public class QnaImageUtils {
	 private static final String filePath =  "C:\\java\\stsApp\\ELTRUT\\src\\main\\webapp\\file\\qnaFile\\";
	 
	 public Map<String, Object> qnaImage(Map<String, Object> map, HttpServletRequest request) throws Exception {

	      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

	      if (multipartHttpServletRequest.getFile("CS_IMAGE1") != null) {
	         MultipartFile file = multipartHttpServletRequest.getFile("CS_IMAGE1");
	         System.out.println(file);
	         String fileName = "CS_IMAGE" + map.get("CS_NUMBER").toString();

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
	         map.put("CS_IMAGE1", fileName + IMAGEExtension);
	      }
	      return map;
	   }
	 
}
