<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.agilin.vo.MemberVO"%>
<%@page import="kr.or.agilin.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.agilin.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%
	String mem_id = null;
	String mem_id2 = null;
	
	mem_id = request.getParameter("mem_id");
	mem_id2 = request.getParameter("mem_id2");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
%>    
<c:set var="memberInfo" value="<%=memberInfo %>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 상세 내용</title>
</head>
<style>
		.fieldName {text-align: center; background-color: #f4f4f4;}
		.tLine {background-color: #d2d2d2; height: 1px;}
		.btnGroup { text-align: right; }
		td {text-align: left; }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/validation.js"></script>
<script type="text/javascript">
	$(function(){

		$('input[name=mem_name]').val('${memberInfo.mem_name}');
		
		$('input[name=mem_bir]').val('${memberInfo.mem_bir}');
		
		$('input[name=mem_id]').val('${memberInfo.mem_id}');
		
		$('input[name=mem_pass]').val('${memberInfo.mem_pass}');
		
		$('input[name=mem_hp]').val('${memberInfo.mem_hp}');
		
		$('input[name=mem_mail]').val('${memberInfo.mem_mail}');
		
		$('input[name=mem_add1]').val('${memberInfo.mem_add1}');
		
		$('input[name=mem_add2]').val('${memberInfo.mem_add2}');
		
		$('input[name=mem_job').val('${memberInfo.mem_job}');
	
		$('form[name=memberView]').submit(function(){
			
			$(this).attr('action', '${pageContext.request.contextPath }/board/updateMember.jsp');
			
			if (!$('input[name=mem_id]').val().validationID()) {
				alert('아이디를 바르게 입력해주세요.');
				return false;
			}
			if (!$('input[name=mem_pass]').val().validationPWD()) {
				alert('비밀번호를 바르게 입력해주세요.');
				return false;
			}
			if (!$('input[name=mem_name]').val().validationNM()) {
				alert('이름을 바르게 입력해주세요.');
				return false;
			}
			if (!$('input[name=mem_name]').val().validationNM()) {
				alert('생일을 바르게 입력해주세요.');
				return false;
			}
			if (!$('input[name=mem_hp]').val().validationHP()) {
				alert('휴대폰 번호를 바르게 입력해주세요.');
				return false;
			}
			if (!$('input[name=mem_mail]').val().validationMAIL()) {
				alert('이메일을 바르게 입력해주세요.');
				return false;
			}
			if (!$('input[name=mem_add1]').val().validationADD1()) {
				alert('주소를 바르게 입력해주세요.');
				return false;
			}
			if (!$('input[name=mem_job]').val().validationJOB()) {
				alert('직업을 바르게 입력해주세요.');
				return false;
			}
			
			return true;
		}); 
		
		$('#btn2').click(function(){
			$(location).attr('href', '${pageContext.request.contextPath }/board/memberView.jsp?mem_id=${memberInfo.mem_id}');
		});
		
	});
</script>
<body>
<input type="hidden" id="mem_id2"/>
	<form name="memberView" method="post">
		<table width="80%" border="0" cellpadding="0" cellspacing="0">
			<tr><td class="tLine" colspan="2"></td></tr>
			<tr>
				<td class="fieldName" width="100px" height="25">성 명</td>
				<td>
					<input type="text" name="mem_name" value=""/>
				</td>
			</tr>
			<tr><td class="tLine" colspan="2"></td></tr>	
			<tr>
				<td class="fieldName" width="100px" height="25">생년월일</td>
				<td>
					<input type="text" name="mem_bir" value=""/>
				</td>
			</tr>
			<tr><td class="tLine" colspan="2"></td></tr>
			
			<tr>
				<td class="fieldName" width="100px" height="25">아이디</td>
				<td>
					<input type="text" name="mem_id" value="">
				</td>
			</tr>
			<tr><td class="tLine" colspan="2"></td></tr>
			
			<tr>
				<td class="fieldName" width="100px" height="25">비밀번호</td>
				<td>
					<input type="text" name="mem_pass" value="" />
				</td>
			</tr>
			<tr><td class="tLine" colspan="2"></td></tr>
			<tr>
				<td class="fieldName" width="100px" height="25">핸드폰</td>
				<td>
					<input type="text" name="mem_hp" value=""/>
				</td>
			</tr>
			<tr><td class="tLine" colspan="2"></td></tr>
			<tr>
				<td class="fieldName" width="100px" height="25">이메일</td>
				<td>
					<input type="text" name="mem_mail" value="" /> 
				</td>
			</tr>
			<tr><td class="tLine" colspan="2"></td></tr>
			<tr>
				<td class="fieldName" width="100px" height="25">주소</td>
				<td> 
					<input type="text" name="mem_add1" id="mem_add1" value="" /> 
					<input type="text" name="mem_add2" id="mem_add2" value="" />
				</td>
			</tr>
			<tr><td class="tLine" colspan="2"></td></tr>
			<tr>
				<td class="fieldName" width="100px" height="25">직 업</td>
				<td>
					<input type="text" name="mem_job" value=""/>
				</td>
			</tr>
			<tr><td colspan="2" height="20"></td></tr>				
			<tr>
				<td class="btnGroup" colspan="2" >
					<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">수정하기</button>
					<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="reset">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>