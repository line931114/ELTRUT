package b21.spring.adminMember;

import java.util.List;
import java.util.Map;

public interface AdminMemberService {

	// 회원 전체목록 불러오기
	public List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception;
	
	// 회원 상세정보
	public Map<String, Object> memberDetail(Map<String, Object> map) throws Exception;
	
	// 회원 정보 수정
	public void modifyMember(Map<String, Object> map) throws Exception;
	
	// 회원강제 탈퇴
	public void deleteMember(Map<String, Object> map) throws Exception;
	
	// 회원 아이디로 검색
	public List<Map<String, Object>> searchMemberId(Map<String, Object> map) throws Exception;
	
	// 회원 이름으로 검색
	public List<Map<String, Object>> searchMemberName(Map<String, Object> map) throws Exception;
	
	// 회원 전화번호로 검색
	public List<Map<String, Object>> searchMemberPhone(Map<String, Object> map) throws Exception;
	
	// 회원 이메일로 검색
	public List<Map<String, Object>> searchMemberEmail(Map<String, Object> map) throws Exception;
	
	// 탈퇴한 회원 목록
	public List<Map<String, Object>> session(Map<String, Object> map) throws Exception;
	
	
}
