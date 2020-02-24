package kr.or.agilin.listener;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;

public class CustomServletRequestListener implements
		ServletRequestAttributeListener, ServletRequestListener {

	@Override
	public void requestDestroyed(ServletRequestEvent arg0) {
		System.out.println("HttpServletRequest 소멸(서버가 클라이언트 대상 응답 전송시마다)시 전파되는 이벤트 청취자");	
	}

	@Override
	public void requestInitialized(ServletRequestEvent arg0) {
		System.out.println("HttpServletRequest 생성(클라이언트의 리다이렉트 요청시마다)시 전파되는 이벤트 청취자");	
	}

	@Override
	public void attributeAdded(ServletRequestAttributeEvent event) {
		// setAttribute(key, value);
		// key
		String saveKey = event.getName();
		// value
		Object value = event.getValue();
		System.out.println("HttpServletRequest.setAttribute(키, 값)값 저장 시 이벤트 청취자");	
	}

	@Override
	public void attributeRemoved(ServletRequestAttributeEvent arg0) {
		System.out.println("HttpServletRequest.setAttribute(키)값 삭제 시 이벤트 청취자");	
	}

	@Override
	public void attributeReplaced(ServletRequestAttributeEvent arg0) {
		System.out.println("HttpServletRequest.setAttribute(동일키, 다른값)값 갱신 시 이벤트 청취자");	
	}

}
