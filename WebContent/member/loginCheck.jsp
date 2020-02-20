<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 폼에서 입력한 아이디와 비밀번호 값을 얻는다.
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		// 얻어온 아디디의 정보를 SELECT하여 가져온다. 
		pstmt = conn.prepareStatement("select * from SCOTT.MEMBER where MEM_ID=?");
		pstmt.setString(1, mem_id);
		rs = pstmt.executeQuery();
		
		// 비밀번호가 일치한다면 세션에 아이디를 등록하고 메인페이지로 이동한다.
		if(rs.next()){
				if(mem_pass.equals(rs.getString("MEM_PASS"))){
							session.setAttribute("mem_id", mem_id);
							
					 		out.println("<Script>");	
					 		out.println("location.href='memberList.jsp'");	
					 		out.println("</Script>");
				}
		}
		
		// 아이디, 비밀번호가 존재하지 않거나 아이디, 비밀번호가 일치하지 않는 경우 alert 창이 나타나고 확인 버튼을 누르면 loginForm으로 이동한다.
		out.println("<Script>");	
 		out.println("location.href='loginForm.jsp'");	
 		out.println("alert('사용자계정이 맞지 않습니다.')");	
 		out.println("</Script>");
		
	}catch(Exception e){
		e.printStackTrace();
	
	}

%>	