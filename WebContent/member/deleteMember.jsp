<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//	입력한 데이터를 가져올 시 한글 데이터가 깨지지 않도록 인코딩 처리한다.
	request.setCharacterEncoding("UTF-8");

	String mem_id = null;
	
	if((!((String)session.getAttribute("mem_id")).equals("a001"))){
		out.println("<script>");
		out.println("location.href='memberList.jsp'");
		out.println("alert('탈퇴 되었습니다.')");
		out.println("</script>");
	}else if((((String)session.getAttribute("mem_id")).equals("a001"))){
		out.println("<script>");
		out.println("location.href='memberList.jsp'");
		out.println("alert('탈퇴 되었습니다.')");
		out.println("</script>");
	}
	
	
// 	삭제할 아이디에 변수를 저장
	String delete_id = request.getParameter("mem_id");	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
// 		member 테이블에서 변수에 저장해두었던 아이디 삭제
		pstmt = conn.prepareStatement("delete from SCOTT.MEMBER where MEM_ID=?");
		pstmt.setString(1, delete_id);
		pstmt.executeUpdate();	
		
	}catch(Exception e){
		e.printStackTrace();
	
	}

%>    