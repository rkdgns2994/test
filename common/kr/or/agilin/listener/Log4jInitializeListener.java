package kr.or.agilin.listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import kr.or.agilin.utiles.Log4jInitialize;


// ServletContextListener : application(ServletContext)의 생성, 소멸 시
//							전파되는 이벤트 청취자 자격 부여				
// ServletContextAttributeListener : 저장영역 값 저장 application.setAttribute(키, 값)
//									 저장영역 값 삭제 application.setAttribute(키, 값)
//									 저장영역 값 갱신 application.setAttribute(동일키, 다른값)
//									 전파되는 이벤트 청취자 자격 부여
public class Log4jInitializeListener implements
		ServletContextAttributeListener, ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("application(ServletContext)가 소멸 시 전파되는 이벤트의 리스너");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("application(ServletContext)가 최초 인스턴스화 시 전파되는 이벤트의 리스너");
		Log4jInitialize.init();
	}

	@Override
	public void attributeAdded(ServletContextAttributeEvent arg0) {
		System.out.println("application(ServletContext)가 application.setAttribute(키, 값) 저장영역 내 값 저장 시 전파되는 이벤트 청취자");
	}

	@Override
	public void attributeRemoved(ServletContextAttributeEvent arg0) {
		System.out.println("application(ServletContext)가 application.setAttribute(키, 값) 저장영역 내 값 삭제 시 전파되는 이벤트 청취자");

	}

	@Override
	public void attributeReplaced(ServletContextAttributeEvent arg0) {
		System.out.println("application(ServletContext)가 application.setAttribute(동일키, 다른값) 저장영역 내 값 갱신 시 전파되는 이벤트 청취자");

	}

}
