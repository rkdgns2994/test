<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입폼</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/validation.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/cookieControl.js"></script>
<script type="text/javascript">
	$(function(){
		
	// 취소
	$('input[id=btn2]').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath }/board/memberForm.jsp');
	});
	
	// 목록
	$('button[id=btn3]').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath }/board/loginForm.jsp');
	});

	// 가입할 때 정규표현식 확인 절차 구현
	$('form[name=memberForm]').submit(function(){
			if(!$('input[name=mem_name]').val().validationNM()){
				alert('성명을 바르게 입력해주세요.');
				return false;};
			
			var bir = $('input[name=mem_bir1]').val() + '-' + $('input[name=mem_bir2]').val() + '-' + $('input[name=mem_bir3]').val();
			if(!bir.validationBIR()){
				alert('생년월일을 바르게 입력해주세요.');
				return false;}
			
			if(!$('input[name=mem_id]').val().validationID()){
				alert('아이디를 바르게 입력해주세요.');
				return false;};
			
		    if(!$('input[name=mem_pass]').val().validationPWD()){
				alert('비밀번호를 바르게 입력해주세요.');
				return false;};
			
			var hp = $('select[name=mem_hp1] option:selected').val() + '-' + $('input[name=mem_hp2]').val() + '-' + $('input[name=mem_hp3]').val();
			if(!hp.validationHP()){
				alert('휴대폰 번호를 바르게 입력해주세요.');
				return false;};
			
			var mail = $('input[name=mem_mail1]').val() + '@' + $('select[name=mem_mail2] option:selected').val();
			if(!mail.validationMAIL()){
				alert('메일을 바르게 입력해주세요.');
				return false;};
			
			if($('input[name=mem_add1]').val().length == 0 || $('input[name=mem_add2]').val().length == 0){
				alert('주소를 모두 입력해주세요.');
				return false;
			}
		    
			if($('input[name=mem_job]').val().length == 0){
				alert('직업을 바르게 입력해주세요.');
				return false;
			}
				
			$('input[name=mem_bir]').attr('value',bir);

			$('input[name=mem_hp]').attr('value', hp);
			
			$('input[name=mem_mail]').attr('value',mail);

			$('form[name=memberForm]').append($('<input type="hidden" name="mem_comtel" value="042-000-0000" />'));
			
			
		});
	
	});

function idCheck(){
	if(!$('input[name=mem_id]').val().validationID()){
		alert('아이디를 바르게 입력해주세요.');
		return false;
	}
	
	$.ajax({
	    type : "POST" 	// 전송방식을 지정한다(POST, GET)
	    // 아래는 호출 URL을 설정한다. GET 방식일 경우 뒤에 파라미터를 붙여서 사용해도 된다.
	    , url : "${pageContext.request.contextPath }/board/checkedID.jsp" 
	    // 호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 활용할 수 있다.
	    , dataType : "json" 
	    , data : { mem_id : $('input[name=mem_id]').val() } 
	    , error : function(result) {
	                  alert("code : " + request.status + "\r\nmessage : " + request.reponseText);
	              }
	    
	    , success : function(result) {
						if(eval(result.flag)){		
							alert("사용할 수 있는 아이디입니다.");
						}else{
							alert("사용할 수 없는 아이디입니다.");
						}  
				}    	
	    });   
	
}	
</script>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<body>
	<center>
		<form name="memberForm" action="${pageContext.request.contextPath }/board/insertMember.jsp" method="post">
			<table width="30%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>
				<tr>
					<td class="fieldName" width="100px" height="25">성 명</td>
					<td><input type="text" name="mem_name" value="" /></td>
				</tr>
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>
				<tr>
					<td class="fieldName" width="100px" height="25">생년월일</td>
					<td>
						<input type="hidden" name="mem_bir" /> 
						<input type="text" name="mem_bir1" size="4" value="" />년 
						<input type="text" name="mem_bir2" size="2" value="" />월 
						<input type="text"name="mem_bir3" size="2" value="" />일
					</td>
				</tr>
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>

				<tr>
					<td class="fieldName" width="100px" height="25">아이디</td>
					<td><input type="text" name="mem_id" value="">&nbsp;&nbsp;<b><a
							href="javascript:idCheck();">[ID 중복검사]</a></b></td>
				</tr>
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>

				<tr>
					<td class="fieldName" width="100px" height="25">비밀번호</td>
					<td><input type="text" name="mem_pass" value="" /> 8 ~ 20 자리
						영문자 및 숫자 사용</td>
				</tr>
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>

				<tr>
					<td class="fieldName" width="100px" height="25">비밀번호확인</td>
					<td><input type="text" name="mem_pass_confirm" value="" /> 8
						~ 20 자리 영문자 및 숫자 사용</td>
				</tr>
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>
			</table>
			<table width="30%" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>

				<tr>
					<td class="fieldName" width="100px" height="25">핸드폰</td>
					<td><input type="hidden" name="mem_hp" /> 
					<select name="mem_hp1">
							<option value="010">010</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="019">019</option>
					</select> - <input type="text" name="mem_hp2" size="4" value="" /> - <input type="text" name="mem_hp3" size="4" value="" /></td>
				</tr>
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>

				<tr>
					<td class="fieldName" width="100px" height="25">이메일</td>
					<td><input type="hidden" name="mem_mail" /> <input
						type="text" name="mem_mail1" value="" /> @ <select
						name="mem_mail2">
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
					</select></td>
				</tr>
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>

				<tr>
					<td class="fieldName" width="100px" height="25">주소</td>
					<td> 
						<input type="text" name="mem_add1" id="mem_add1" value="" /> 
						<input type="text" name="mem_add2" id="mem_add2" value="" />
					</td>
				</tr>
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>
				<tr>
					<td class="fieldName" width="100px" height="25">직 업</td>
					<td><input type="text" name="mem_job" value="" /></td>
				</tr>
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>
				<tr>
					<td class="tLine" colspan="2"></td>
				</tr>

				<tr>
					<td colspan="2" height="20"></td>
				</tr>

				<tr>
					<td class="btnGroup" colspan="2">
						<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">가입하기</button>
						<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="reset">취소</button>
						<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">로그인폼으로...</button>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>