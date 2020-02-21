package kr.or.agilin.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.agilin.ibatis.factory.SqlMapClientFactory;
import kr.or.agilin.vo.MemberVO;

public class IMemberDaoImpl implements IMemberDao {
	
	private static IMemberDao dao = new IMemberDaoImpl();
	private SqlMapClient client;
	
	private IMemberDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDao getInstance(){
		return (dao == null) ? dao = new IMemberDaoImpl() : dao;
	}
	
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws SQLException {
		return (MemberVO) client.queryForObject("member.memberInfo", params);
	}

	@Override
	public List<MemberVO> memberList(Map<String, String> params) throws SQLException {
		return client.queryForList("member.memberList", params);
	}

	@Override
	public void insertMember(MemberVO memberInfo) throws SQLException {
		client.update("member.insertMember", memberInfo);
	}

	@Override
	public void updateMember(MemberVO memberInfo) throws SQLException {
		client.update("member.updateMember", memberInfo);
	}

	@Override
	public void deleteMember(Map<String, String> params) throws SQLException {
		client.update("member.deleteMember", params);
	}

}
