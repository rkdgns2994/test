package kr.or.agilin.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.agilin.member.dao.IMemberDao;
import kr.or.agilin.member.dao.IMemberDaoImpl;
import kr.or.agilin.vo.MemberVO;

public class IMemberServiceImpl implements IMemberService {
	
	// 싱글톤 패턴
	private static IMemberService service = new IMemberServiceImpl();
	private IMemberDao dao;
	
	private IMemberServiceImpl(){
		dao = IMemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance(){
		return (service == null) ? service = new IMemberServiceImpl() : service;
	}

	@Override
	public MemberVO memberInfo(Map<String, String> params) {
		MemberVO memberInfo = null;
		try {
			memberInfo = dao.memberInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberInfo;
	}

	@Override
	public List<MemberVO> memberList(Map<String, String> params) {
		List<MemberVO> memberList = null;
		try {
			memberList = dao.memberList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberList;
	}

	@Override
	public void insertMember(MemberVO memberInfo) {
		try {
			dao.insertMember(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateMember(MemberVO memberInfo) {
		try {
			dao.updateMember(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMember(Map<String, String> params) {
		try {
			dao.deleteMember(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
