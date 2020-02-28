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
	
	RequestDispatcher dispatcher = request
			.getRequestDispatcher("/board/main.jsp?contentPage=/board/memberList.jsp");
	dispatcher.forward(request, response);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
//memberView 업데이트 후 창은 닫은 뒤 memberList(부모창)은 새로고침 됨
	opener.location.reload();
	window.close();
</script>
<title>deleteMember</title>
</head>
<body>
</body>
</html>