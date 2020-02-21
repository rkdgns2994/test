package kr.or.agilin.member.service;

import java.util.List;
import java.util.Map;

import kr.or.agilin.vo.MemberVO;

public interface IMemberService {
	
	public MemberVO memberInfo(Map<String, String> params);
	
	public List<MemberVO> memberList(Map<String, String> params);
	
	public void insertMember(MemberVO memberInfo);
	
	public void updateMember(MemberVO memberInfo);
	
	public void deleteMember(MemberVO memberInfo);
	
}
