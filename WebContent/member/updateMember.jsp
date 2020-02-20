<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		
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
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement("update SCOTT.MEMBER" 
										  +"set MEM_PASS=?, MEM_NAME=?,"
										  +    "MEM_BIR=?, MEM_ADD1=?, MEM_ADD2=?,"
										  +    "MEM_HP=?, MEM_MAIL=?, MEM_JOB=?"
										  + "where MEM_ID=?");
			
			pstmt.setString(1, rs.getString("mem_pass"));
			pstmt.setString(2, rs.getString("mem_name"));
			pstmt.setString(3, rs.getString("mem_bir"));
			pstmt.setString(4, rs.getString("mem_add1"));
			pstmt.setString(5, rs.getString("mem_add2"));
			pstmt.setString(6, rs.getString("mem_hp"));
			pstmt.setString(7, rs.getString("mem_mail"));
			pstmt.setString(8, rs.getString("mem_job"));
			pstmt.setString(9, rs.getString("mem_id"));
			pstmt.executeUpdate();
			rs.next();
			
			int result = pstmt.executeUpdate();

//	 		레코드가 수정되면 회원리스트으로 이동, 그렇지 않으면 다시 회원뷰 폼으로 이동.
			if(result!=0){
					out.println("<script>");	
					out.println("location.href='memberList.jsp'");	
					out.println("alert('정상 수정 되었습니다:)')");	
					out.println("</script>");	
			}else{
					out.println("<script>");	
					out.println("location.href='memberForm.jsp'");	
					out.println("alert('수정에 실패하였습니다.:/')");
					out.println("</script>");
			}	
			
		}catch(Exception e){
			e.printStackTrace();
		
		}
%>