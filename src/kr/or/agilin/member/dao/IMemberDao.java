package kr.or.agilin.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.agilin.vo.MemberVO;

public interface IMemberDao {

	public MemberVO memberInfo(Map<String, String> params) throws SQLException;
	
	public List<MemberVO> memberList(Map<String, String> params)throws SQLException;
	
	public void insertMember(MemberVO memberInfo) throws SQLException;
	
	public void updateMember(MemberVO memberInfo) throws SQLException;
	
	public void deleteMember(MemberVO memberInfo) throws SQLException;
	
}
