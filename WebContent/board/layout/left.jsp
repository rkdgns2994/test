<%@page import="kr.or.agilin.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
	<div class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
		<header class="demo-drawer-header">
			<div class="demo-avatar-dropdown">
				<span id="loginPrt"><font color="red"><%=((MemberVO)session.getAttribute("LOGIN_MEMBERINFO")) == null ? "비회원" : ((MemberVO)session.getAttribute("LOGIN_MEMBERINFO")).getMem_name() %></font>님 환영합니다.</span>
<%-- 				${sessionScope.memberInfo.mem_name} 은 익스프레션 랭귀지라고 한다. --%>
<%-- 				<span id="loginPrt"><font color="red">${sessionScope.memberInfo.mem_name}</font>님 환영합니다.</span> --%>
				<div class="mdl-layout-spacer"></div>
			</div>
		</header>
		<nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
			<a class="mdl-navigation__link" href="${pageContext.request.contextPath }/06/main.jsp?contentPage=/06/memberList.jsp"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">home</i>Home</a>
			<a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">inbox</i>Inbox</a>
			<a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">delete</i>Trash</a>
			<a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">report</i>Spam</a>
			<a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">forum</i>Forums</a>
			<a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">flag</i>Updates</a>
			<a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">local_offer</i>Promos</a>
			<a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">shopping_cart</i>Purchases</a>
			<a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">people</i>Social</a>
			<div class="mdl-layout-spacer"></div>
			<a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
		</nav>
	</div>
</div>
</body>
</html>