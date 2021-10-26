package b21.spring.adminMember;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

	@Resource(name = "adminMemberDAO")
	private AdminMemberDAO adminMemberDAO;
	
	// 회원 전체목록 불러오기
	@Override
	public List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception {
		return adminMemberDAO.memberList(map);
	}
	
	// 회원 상세정보
	@Override
	public Map<String, Object> memberDetail(Map<String, Object> map) throws Exception {
		return adminMemberDAO.memberDetail(map);
	}
	
	// 회원 정보 수정
	@Override
	public void modifyMember(Map<String, Object> map) throws Exception {
		adminMemberDAO.modifyMember(map);
	}
	
	// 회원강제 탈퇴
	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		adminMemberDAO.deleteMember(map);
	}
	
	// 회원 아이디로 검색
	@Override
	public List<Map<String, Object>> searchMemberId(Map<String, Object> map) throws Exception {
		return adminMemberDAO.searchMemberId(map);
	}
	
	// 회원 이름으로 검색
	@Override
	public List<Map<String, Object>> searchMemberName(Map<String, Object> map) throws Exception {
		return adminMemberDAO.searchMemberName(map);
	}
	
	// 회원 전화번호로 검색
	@Override
	public List<Map<String, Object>> searchMemberPhone(Map<String, Object> map) throws Exception {
		return adminMemberDAO.searchMemberPhone(map);
	}
	
	// 회원 이메일로 검색
	@Override
	public List<Map<String, Object>> searchMemberEmail(Map<String, Object> map) throws Exception {
		return adminMemberDAO.searchMemberEmail(map);
	}

	public List<Map<String, Object>> session(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminMemberDAO.session(map);
	}

	
	
		
}