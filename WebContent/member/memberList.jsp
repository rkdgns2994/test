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
		
		$('table tr:gt(0)').click(function(){
			var mem_id = $(this).find('td:eq(0)').text();
			location.href = '<%=request.getContextPath()%>/member/memberView.jsp?mem_id=' + mem_id;
		});
	
		$("#allCheck").click(function(){
			var chk = $("#allCheck").prop("checked");
			if(chk){
				$(".chBox").prop("checked", true);
			}else{
				$(".chBox").prop("checked", false);
			}
		});
		
		$("#chBox").click(function(){
			$("#allCheck").prop("checked", false);
		});

		$('#selectDelete_Btn').click(function(){
			$(location).attr('href', '${pageContext.request.contextPath }/member/deleteMember.jsp?mem_id=${rs.getString("mem_id")}');
		});
		
});
	
	
	
</script>
</head>
<body>
<center>
	<table border = 1>
		 <tr bgcolor="blue" align ="center">
			<th colspan = "10" span style="color:white">회원현황</th>
    	</tr>
		<tr>
			<td><a href="<%=request.getContextPath()%>/member/loginForm.jsp" style="color:black;">로그아웃</a></td>
		</tr>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>휴대폰번호</th>
			<th>이메일</th>
			<th>직업</th>
			<th>
				<input id="allCheck" type="checkbox" onclick="allChk(this);" value="All"/><label>모두체크</label>&nbsp;/&nbsp;
				<button type="button" id="selectDelete_Btn" class="selectDelete_Btn">선택삭제</button>
			</th>
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
<%-- 				<td><a href="<%=request.getContextPath()%>/member/deleteMember.jsp?mem_id=<%=rs.getString("mem_id")%>">탈퇴</a></td> --%>
				<td><center><input type="checkbox" name="chBox" class="chBox" id="chBox" value="<%=rs.getString("mem_id")%>"/></center></td>
			</tr>

			<%
				}
			%>

		</tbody>
	</table>
</center>	
</body>
</html>