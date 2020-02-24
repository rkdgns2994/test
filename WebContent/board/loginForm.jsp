<%@page import="kr.or.agilin.utiles.CryptoGenerator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	// 공개키 취득
	Map<String, String> publicKeyMap = CryptoGenerator.generatePairKey(session);
	
%>
<c:set var="publicKeyMap" value="<%=publicKeyMap %>"></c:set>  
<c:url var="loginCheckURL" value="/board/loginCheck.jsp"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>로그인폼</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/validation.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/cookieControl.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jsbn.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath }/js/rsa.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath }/js/prng4.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath }/js/rng.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/core.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/sha256.js"></script>
<script type="text/javascript">
$(function(){
	
	if(Get_Cookie('mem_id')){
		$('input[name=mem_id]').val(Get_Cookie('mem_id'));
	}	
	
	$('#loginBtn').click(function(){
		if(!$('input[name=mem_id]').val().validationID()){
			alert('아이디를 바르게 입력해주세요.');
			return;
		}
		if(!$('input[name=mem_pass]').val().validationPWD()){
			alert('패스워드를 바르게 입력해주세요.');
			return;
		}
		
		var mem_id = $('input[name=mem_id]').val();
		var mem_pass = $('input[name=mem_pass]').val();
		
		var modulus = '${publicKeyMap.publicModulus}';
		var exponent = '${publicKeyMap.publicExponent}';
		
		var rsaOBJ = new RSAKey();
		rsaOBJ.setPublic(modulus, exponent);
		
		var encrypt_id = rsaOBJ.encrypt(mem_id);
		var encrypt_pass = rsaOBJ.encrypt(mem_pass);
		
		var $frm = $('<form action="${loginCheckURL}" method="POST"></form>');
		$frm.append('<input type="hidden" name="mem_id" value="' + encrypt_id + '"/>');
		$frm.append('<input type="hidden" name="mem_pass" value="' + encrypt_pass + '"/>');
		
		$(document.body).append($frm);

		$frm.submit();
	});
	
});
</script>
</head>
<body>
  <center>
	<table width="770" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 90px;">
		<tr>
			<td height="150" align="center"><img src="${pageContext.request.contextPath }/image/p_login.gif" /></td>
		</tr>
		<tr>
			<td height="174" style="background: url(${pageContext.request.contextPath }/image/login_bg.jpg); border: 1px solid #e3e3e3;">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="260" height="110" align="center" style="border-right: 1px dotted #736357;">
							<img src="${pageContext.request.contextPath }/image/logo.gif" />
						</td>
						<td>
							<table border="0" align="center" cellpadding="5" cellspacing="0">
								<tr>
									<td><b>아이디</b></td>
									<td><input type="text" name="mem_id" class="box" tabindex="3" height="18" /></td>
									<td rowspan="2">
										<img src="${pageContext.request.contextPath }/image/login.gif" id="loginBtn"/>
									</td>
								</tr>
								<tr>
									<td><b>패스워드</b></td>
									<td><input type="password" name="mem_pass" class="box" tabindex="3" height="18" /></td>
								</tr>
								<tr>
									<td colspan="3" align="right">
										<a href="${pageContext.request.contextPath }/board/memberForm.jsp">회원가입</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
  </center>	
</body>
</html>