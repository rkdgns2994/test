
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

// 		if((session.getAttribute("mem_id") == null) ||
// 		  (!((String)session.getAttribute("mem_id")).equals("a001"))){
// 			out.println("<Script>");	
// 			out.println("location.href='loginForm.jsp'");	
// 			out.println("</Script>");	
// 		}
	
	String delete_id = request.getParameter("mem_id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = 
					(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("delete from SCOTT.MEMBER where MEM_ID=?");
		pstmt.setString(1, delete_id);
		
		int result = pstmt.executeUpdate();

// 		레코드가 삭제되면 로그인 폼으로 이동, 그렇지 않으면 다시 회원리스트 폼으로 이동.
		if(result!=0){
				out.println("<script>");	
				out.println("location.href='loginForm.jsp'");	
				out.println("alert('정상 삭제되었습니다:)')");	
				out.println("</script>");	
		}else{
				out.println("<script>");	
				out.println("location.href='memberList.jsp'");	
				out.println("alert('삭제에 실패하였습니다.:/')");
				out.println("</script>");
		}	
		
	}catch(Exception e){
		e.printStackTrace();
	
	}

%>    