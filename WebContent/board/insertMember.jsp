<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.agilin.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.agilin.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.agilin.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	MemberVO memberInfo = new MemberVO();

	BeanUtils.populate(memberInfo, request.getParameterMap());
	
	String mem_id = request.getParameter("mem_id");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	service.insertMember(memberInfo);
	MemberVO memberVO = service.memberInfo(params);
	
	if(memberVO == null){
		String message = URLEncoder.encode("회원가입에 실패하였습니다.", "UTF-8");
		response.sendRedirect(request.getContextPath()+"/board/loginForm.jsp?message" + message);
	}else{
		String message = URLEncoder.encode("회원가입에 성공하였습니다.", "UTF-8");
		response.sendRedirect(request.getContextPath()+"/board/loginForm.jsp?message" + message);
	}
	
%>