<%@page import="kr.or.agilin.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
</head>
<body>
	<div class="android-header mdl-layout__header mdl-layout__header--waterfall">
		<div class="mdl-layout__header-row">
			<span class="android-title mdl-layout-title"> 
				<a class="mdl-navigation__link mdl-typography--text-uppercase" href="${pageContext.request.contextPath }/board/main.jsp"><font color="yellow" style="font-size: 20px;">Agilin TEST BOARD</font></a>
			</span>
			<!-- Add spacer, to align navigation to the right in desktop -->
			<div class="android-header-spacer mdl-layout-spacer"></div>
			<!-- Navigation -->
			<div class="android-navigation-container">
				<nav class="android-navigation mdl-navigation"> 
					<span id="loginPrt"><font color="red"><%=((MemberVO)session.getAttribute("LOGIN_MEMBERINFO")) == null ? "비회원" : ((MemberVO)session.getAttribute("LOGIN_MEMBERINFO")).getMem_name() %></font>님 환영합니다.</span>
					<a class="mdl-navigation__link mdl-typography--text-uppercase" href="${pageContext.request.contextPath }/board/loginForm.jsp">로그인폼</a>
					<a class="mdl-navigation__link mdl-typography--text-uppercase" href="${pageContext.request.contextPath }/board/logout.jsp">로그아웃</a> 
				</nav>
			</div>
			<button
				class="android-more-button mdl-button mdl-js-button mdl-button--icon mdl-js-ripple-effect"
				id="more-button">
				<i class="material-icons">more_vert</i>
			</button>
			<ul	class="mdl-menu mdl-js-menu mdl-menu--bottom-right mdl-js-ripple-effect" for="more-button">
				<li class="mdl-menu__item" id="info">개인정보수정</li>
				<li class="mdl-menu__item" id="myhome">마이홈</li>
				<li class="mdl-menu__item" id="logout"></li>
			</ul>
		</div>
	</div>
</body>
</html>