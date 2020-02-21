<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>agilin 연습용 게시판</title>
<script src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">

.mdl-layout__container {
	width: 240px;
}

</style>
</head>
<body>
<center>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/board/layout/header.jsp" />
		</div>
		<p style="clear: both;"></p>
		<div>
			<div id="content" style="height: 720px; margin-left: 50px; margin-right: 50px; overflow: auto;">
				<c:import url="${!empty param.contentPage ? param.contentPage : '/board/memberList.jsp' }"></c:import>
			</div>
		</div>
		<div>
			<c:import url="/board/layout/footer.jsp"></c:import>
		</div>
	</div>
</center>
</body>
</html>
