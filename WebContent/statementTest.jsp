<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// Connection 객체를 생성한다.
	Connection conn = null;

	// 미리 사용할 SQL문을 만들어둔다.
	String sql = "INSERT INTO SCOTT.member"
						+ "(mem_id,mem_pass,mem_name,mem_regno1,mem_regno2,mem_bir,mem_zip,mem_add1,mem_add2,mem_hometel, mem_comtel,mem_hp,mem_mail,mem_job,mem_like,mem_memorial,mem_memorialday,mem_mileage,mem_delete)"
						+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'')";

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		// JNDI를 이용하여 연결된 Connection 객체를 가져온다.
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "2");
		stmt.setString(2, "3");
		stmt.setString(3, "4");
		stmt.setString(4, "5");
		stmt.setString(5, "6");
		stmt.setString(6, "7");
		stmt.setString(7, "8");
		stmt.setString(8, "9");
		stmt.setString(9, "10");
		stmt.setString(10, "11");
		stmt.setString(11, "12");
		stmt.setString(12, "13");
		stmt.setString(13, "14");
		stmt.setString(14, "15");
		stmt.setString(15, "16");
		stmt.setString(16, "17");
		stmt.setString(17, "18");
		stmt.setString(18, "18");
// 		stmt.setString(19, "18");
	
		// 작성해둔 SQL문을 preparedStatement 객체를 이용하여 실행한다.
		int result = stmt.executeUpdate();
		
		// 레코드가 삽입되었는지 확인하고 메세지를 출력한다.
		if(result!=0){
			out.println("<h3>레코드 등록 완료</h3>");
		}	
	}catch(Exception e){
		out.println("<h3>레코드 등록 실패</h3>");
		e.printStackTrace();
		// Exception이 발생할 경우 Exception 내용 출력과 오류를 표시한다.
	}
	
	
%>