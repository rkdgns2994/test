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
	
	// memberView에서 글을 수정 한 뒤 창은 닫고 부모 창인 memberList는 새로고침 해야되므로 아래 두 줄은 주석처리함!!
	//RequestDispatcher dispatcher = request.getRequestDispatcher("/board/memberView.jsp");
	//dispatcher.forward(request, response);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
// memberView 업데이트 후 창은 닫은 뒤 memberList(부모창)은 새로고침 됨
		opener.location.reload();
		window.close();
</script>
<title>updateMember</title>
</head>
<body>
</body>
</html>