<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	회원가입 폼에서  입력한 데이터를 가져올 씨 한글 데이터가 깨지지 않도록 인코딩 처리한다.
	request.setCharacterEncoding("UTF-8");

//	회원가입 폼에서 입력한 데이터를 가져온다.
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");
	String mem_name = request.getParameter("mem_name");
	String mem_bir = request.getParameter("mem_bir");
	String mem_add1 = request.getParameter("mem_add1");
	String mem_add2 = request.getParameter("mem_add2");
	String mem_hp = request.getParameter("mem_hp");
	String mem_mail = request.getParameter("mem_mail");
	String mem_job = request.getParameter("mem_job");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();	
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
// 		입력한 회원정보 레코드를 삽입한다.
		pstmt = conn.prepareStatement("INSERT INTO SCOTT.member VALUES (?,?,?,?,?,?,?,?,?,'')");
		
		pstmt.setString(1, mem_id);
		pstmt.setString(2, mem_pass);
		pstmt.setString(3, mem_name);
		pstmt.setString(4, mem_bir);
		pstmt.setString(5, mem_add1);
		pstmt.setString(6, mem_add2);
		pstmt.setString(7, mem_hp);
		pstmt.setString(8, mem_mail);
		pstmt.setString(9, mem_job);
		
		int result = pstmt.executeUpdate();
		
// 		레코드가 삽입되면 로그인 폼으로 이동, 그렇지 않으면 다시 회원가입 폼으로 이동.
		if(result!=0){
				out.println("<script>");	
				out.println("location.href='loginForm.jsp'");	
				out.println("alert('정상 가입되었습니다:)')");	
				out.println("</script>");	
		}else{
				out.println("<script>");	
				out.println("location.href='memberForm.jsp'");	
				out.println("alert('가입에 실패하였습니다.:/')");
				out.println("</script>");
		}

		
	}catch(Exception e){
		e.printStackTrace();
	}
	

%>