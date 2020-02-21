package kr.or.agilin.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.lang3.StringUtils;


public class EncodingFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
		// 클라이언트 요청시 요청 헤더에 서버에서 요청 데이타 처리를 위한 인코딩 설정 정보를 전송.
		// 클라이언트 요청시 쿼리스트링 method=GET : server.xml 파일 내 <<connector URIEncoding="UTF-8"/>
		//						  method=POST : jsp 내 reqeust.setCharacterEncoding("UTF-8");
		String encodingType = servletRequest.getCharacterEncoding();
		
		// http://commons.apache.org
		//     commons-lang3-3.1.jar
		// WEB-INF/lib import
		if(StringUtils.isEmpty(encodingType)){
			encodingType = "UTF-8";
		}
		
		servletRequest.setCharacterEncoding(encodingType);
		
		// servletRequest, servletResponse는 jsp의 기본객체
		// HttpServletRequest, HttpServletResponse를 생성할 때 활용
		filterChain.doFilter(servletRequest, servletResponse);
	}		

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
