<%@page import="com.sun.corba.se.impl.protocol.giopmsgheaders.RequestMessage"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.agilin.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.agilin.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");

	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	service.deleteMember(params);
	
	String message = URLEncoder.encode("강제탈퇴가 완료되었습니다.", "UTF-8");
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/board/main?contentPage=/board/memberList.jsp");
	dispatcher.forward(request, response);
	
%>