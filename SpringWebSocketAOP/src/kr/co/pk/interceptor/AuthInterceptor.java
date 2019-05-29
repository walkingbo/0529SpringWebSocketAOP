package kr.co.pk.interceptor;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AuthInterceptor implements HandlerInterceptor {
	//Controller가 요청을 처리하기 전에 호출되는 메소드
		//이 메소드가 true를 리턴하면 Controller 가 요청을 처리하러 이동하고
		//이 메소드가 false를 리턴한면 Controller로 요청을 처리하거 가지 않습니다. 
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
			//로그인 정보 확인 - 세션 user 라는 이름의 객체가 있는 지 확인'
			//user 라는 이름은 직접 정하면  됩니다.
			if(request.getSession().getAttribute("user")==null) {
				//로그인이 되어 있지 않으면 login 페이지로 이동 
				
				try {
					response.sendRedirect("login");
				} catch (Exception e) {
					
					return false;
				}
			}
	
			return true;
		}
}
