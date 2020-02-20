<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String mem_id = null;
	
// 	if((session.getAttribute("mem_id") == null) ||
// 			(!((String)session.getAttribute("mem_id")).equals("a001"))){
// 		out.println("<Script>");	
// 		out.println("location.href='loginForm.jsp'");	
// 		out.println("</Script>");	
// 	}
	
	String info_id = request.getParameter("mem_id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("select * from SCOTT.MEMBER WHERE MEM_ID = ?");
		pstmt.setString(1, info_id);
		rs = pstmt.executeQuery();
		rs.next();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberView</title>
<script src='http://code.jquery.com/jquery-latest.js'></script>
<script>
	$(function(){
		$('input[value=회원탈퇴]').click(function(){
			$(location).attr('href', '<%=request.getContextPath()%>/member/deleteMember.jsp?mem_id=?');
		});
		
		$('input[value=회원목록]').click(function(){
			$(location).attr('href', '<%=request.getContextPath()%>/member/memberList.jsp');
		});
	});
</script>	
</head>
<body>
	<form action="<%=request.getContextPath()%>/member/updateMember.jsp" method="POST">
	<table border=1>
		<tr>
			<td>아이디</td>
			<td><input type='text' name='mem_id' disabled='disabled' value="<%=rs.getString("mem_id")%>"/></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type='text' name='mem_pass' value="<%=rs.getString("mem_pass")%>"/></td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input type='text' name='mem_name' disabled='disabled' value="<%=rs.getString("mem_name")%>"/></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type='text' name='mem_hp' value="<%=rs.getString("mem_hp")%>"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type='text' name='mem_mail' value="<%=rs.getString("mem_mail")%>"/></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type='text' name='mem_add1' value="<%=rs.getString("mem_add1")%>" />&nbsp;&nbsp; 
				<input type='text' name='mem_add2' value="<%=rs.getString("mem_add2")%>" />
			</td>
		</tr>
		<tr>
			<td>직업</td>
			<td><input type='text' name='mem_job' value="<%=rs.getString("mem_job")%>" /></td>
		</tr>
		<tr>
			<td colspan='2'><input type='submit' value='회원정보수정' /> 
			<input type='button' value='회원탈퇴' /> <input type='button' value='회원목록' />
			</td>
		</tr>
	</table>
	</form>
</body>
</html>