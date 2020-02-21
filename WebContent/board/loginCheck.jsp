<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.agilin.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.agilin.vo.MemberVO"%>
<%@page import="kr.or.agilin.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String message = request.getParameter("message");
	String contentPage = request.getParameter("contentPage");
	if(contentPage == null){
		contentPage = "/board/main.jsp";
	}

%>

<%
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
	params.put("mem_pass", mem_pass);
	
	IMemberService service = IMemberServiceImpl.getInstance();	
	
	MemberVO memberInfo = service.memberInfo(params);
	
	if(memberInfo == null){
		message = URLEncoder.encode("회원이 아닙니다.", "UTF-8");
		response.sendRedirect(request.getContextPath() + "/board/loginForm.jsp?message=" + message);
	}else{
		message = URLEncoder.encode(mem_id + "님 로그인 되었습니다.", "UTF-8");
		response.sendRedirect(request.getContextPath() + "/board/main.jsp");
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
	}
%>
