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
// 	  (!((String)session.getAttribute("mem_id")).equals("a001"))){
// 		out.println("<Script>");	
// 		out.println("location.href='loginForm.jsp'");	
// 		out.println("</Script>");	
// 	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = 
					(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("select * from SCOTT.MEMBER order by MEM_ID asc");
		rs = pstmt.executeQuery();
	
	}catch(Exception e){
		e.printStackTrace();
	
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberList</title>
<script src='http://code.jquery.com/jquery-latest.js'></script>
<style>
			
			th {
				padding: 10px;
				border: 1px solid #444444;
			}
			
			td {
				padding: 10px;
				border: 1px solid #444444;
			}
			
			a{
				color : red;
			}

</style>
<script>
	$(function() {
		$('table tr:gt(0)').click(
				function() {
					var mem_id = $(this).find('td:eq(0)').text();
					location.href = '<%=request.getContextPath()%>/member/memberView.jsp?mem_id='+mem_id;
				});
	});
</script>
</head>
<body>
<center>
	<table border = 1>
		<input type="button" value="뒤로가기" onclick="location.href='<%=request.getContextPath()%>/member/loginForm.jsp'"/>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>휴대폰번호</th>
			<th>이메일</th>
			<th>직업</th>
			<th>삭제</th>
		</tr>
		<tbody>
		
			<%
				while(rs.next()){
			%>
		
			<tr>
				<td><%=rs.getString("MEM_ID")%></td>
				<td><%=rs.getString("MEM_NAME")%></td>
				<td><%=rs.getString("MEM_BIR")%></td>
				<td><%=rs.getString("MEM_HP")%></td>
				<td><%=rs.getString("MEM_MAIL")%></td>
				<td><%=rs.getString("MEM_JOB")%></td>
				<td id="delete"><a href="deleteMember.jsp?MEM_ID=<%=rs.getString("MEM_ID")%>">삭제</a></td>
			</tr>

			<%
				}
			%>

		</tbody>
		
		
	</table>
</center>	
</body>
</html>