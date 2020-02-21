package kr.or.agilin.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.agilin.vo.MemberVO;

public class IMemberDaoImpl implements IMemberDao {
	
	private static IMemberDao dao = new IMemberDaoImpl();
	private SqlMapClient client;
	
	private IMemberDaoImpl(){
	
	}
	
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> memberList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertMember(MemberVO memberInfo) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateMember(MemberVO memberInfo) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteMember(MemberVO memberInfo) throws SQLException {
		// TODO Auto-generated method stub

	}

}
