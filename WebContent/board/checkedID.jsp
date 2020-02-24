<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.agilin.vo.MemberVO"%>
<%@page import="kr.or.agilin.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.agilin.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
	
	// lib에 들어있는 jackson-core-asl-1.9.3.jar와 jackson-mapper-asl-1.9.13.jar 파일을 받는 이유는
	// 자바 객체를 json 형식의 문자열로 바꾸어주고 json 형식의 문자열을 자바객체로 바꿔 주기 때문...
	
	Map<String, String> jsonMap = new HashMap<String, String>();
	if(memberInfo == null){
		jsonMap.put("flag", "true");
	}else{
		jsonMap.put("flag", "false");
	}
	
	ObjectMapper jsonMapper = new ObjectMapper();
	String jsonData = jsonMapper.writeValueAsString(jsonMap);
	
	out.println(jsonData);
 %>    
