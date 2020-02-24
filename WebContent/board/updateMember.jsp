<%@page import="kr.or.agilin.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.agilin.member.service.IMemberService"%>
<%@page import="kr.or.agilin.vo.MemberVO"%>
<%@page import="java.lang.reflect.InvocationTargetException"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	MemberVO memberInfo = new MemberVO();
	
	try {
		BeanUtils.populate(memberInfo, request.getParameterMap());
	} catch (IllegalAccessException e) {
		e.printStackTrace();
	} catch (InvocationTargetException e) {
		e.printStackTrace();
	}
	
	IMemberService service = IMemberServiceImpl.getInstance();
	service.updateMember(memberInfo);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/board/main.jsp");
	dispatcher.forward(request, response);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateMember</title>
</head>
<body>

</body>
</html>