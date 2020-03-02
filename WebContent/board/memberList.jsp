<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.agilin.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.agilin.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.agilin.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%	
	String mem_id = request.getParameter("mem_id");
	String search_keycode = request.getParameter("search_keycode");
	String search_keyword = request.getParameter("search_keyword");	
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("search_keycode", search_keycode);
	params.put("search_keyword", search_keyword);
	params.put("mem_id", mem_id);

	IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberList = service.memberList(params);
	MemberVO memberInfo = service.memberInfo(params);
	
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<c:set var="memberInfo" value="<%=memberInfo %>"></c:set>    
<c:set var="memberList" value="<%=memberList %>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberList</title>
<script src='http://code.jquery.com/jquery-latest.js'></script>
<script>
	$(function() {
		
		$('input[name=mem_id]').val('${memberInfo.mem_id}');
		
		// 테이블의 행 선택 시 팝업창으로 전환되어 보임.
		$('table tr:gt(0)').click(function() {
			var mem_id = $(this).find('td:eq(0)').text();
			var url= '${pageContext.request.contextPath}/board/memberView.jsp?mem_id=' + mem_id;
			var winWidth = 600;	
		    var winHeight = 300;
		    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
			window.open(url, mem_id, popupOption);
		});
		
		// 각 행을 모두 선택할 수 있음.
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

		$("#Delete").click(function(){
			  var confirm_val = confirm("정말 탈퇴시키겠습니까?");
			  
			  if(confirm_val) {
			   var checkArr = new Array();
			   
			   $("input[class='chBox']:checked").each(function(){
			    checkArr.push($(this).attr("value"));
			   });
			    
			   $(location).attr('href', '${pageContext.request.contextPath }/board/deleteMember.jsp?mem_id=${memberInfo.mem_id}');
			  } 
		});
	});
</script>
</head>
<body>
<div id="list">
	<table class="mdl-data-table mdl-js-data-table mdl-data-table" style="width: 90%; ">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">아이디</th>
				<th class="mdl-data-table__cell--non-numeric">패스워드</th>
				<th class="mdl-data-table__cell--non-numeric">이름</th>
				<th class="mdl-data-table__cell--non-numeric">생년월일</th>
				<th class="mdl-data-table__cell--non-numeric">직업</th>
				<th class="mdl-data-table__cell--non-numeric">
					<input id="allCheck" type="checkbox" onclick="allCheck(this);" value="All"/>모두체크
				</th>
			</tr>
		</thead>
		<tbody id="memberListTBY">
			<c:forEach items="${memberList }" var="memberInfo" >
			<tr>
				<td class="mdl-data-table__cell--non-numeric">${memberInfo.getMem_id()}</td>
				<td class="mdl-data-table__cell--non-numeric">${memberInfo.getMem_pass()}</td>
				<td class="mdl-data-table__cell--non-numeric">${memberInfo.getMem_name()}</td>
				<td class="mdl-data-table__cell--non-numeric">${memberInfo.getMem_bir()}</td>
				<td class="mdl-data-table__cell--non-numeric">${memberInfo.getMem_job()}</td>
				<td class="mdl-data-table__cell--non-numeric"><input type="checkbox" name="chBox" class="chBox" id="chBox" value="${memberInfo.getMem_id()}"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="searchForm" align="right" style="margin-top: 20px; width: 90%;">
	<form method="post" action="${pageContext.request.contextPath }/board/main.jsp?contentPage=memberList.jsp">
		<select name="search_keycode">
			<option value="ALL">전체</option>
			<option value="NAME">성명</option>
			<option value="JOB">직업</option>
			<option value="ADD1">주소</option>
		</select>
		<input id = "search_keyword" name = "search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit">검색</button>
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="button" id="Delete" value="${memberInfo.getMem_id() }">강제탈퇴</button>
	</form>
</div>
</body>
</html>