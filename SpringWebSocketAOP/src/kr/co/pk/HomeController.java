package kr.co.pk;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.pk.domain.Register1;


@Controller
public class HomeController {
	
	@Autowired
	private Register1DAO register1DAO;
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Model model, HttpSession session, Register1 register1) {
		System.out.println("param:"+register1);
		
		//로그인 처리 메소드를 호출
		Register1 result =register1DAO.login(register1);
		System.out.println("dao:"+register1);
		//로그인 성공
		if(result != null) {
			//세션에 로그인 정보를 저장
			session.setAttribute("user", result);
			return "redirect:./";
					
		}else {
			return "redirect:login";
		}
		
	}
	
	
	
	//로그인 요청이 GET 방식으로 온 경우 처리하는 메소드 
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String login(Model model) {
		
		return "login";
	}
	
	
	
	//시작 요청이 오면 home 이라는 뷰로 포워딩 하도록 설정
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	@RequestMapping(value = "chat", method = RequestMethod.GET)
	public String chat(Locale locale, Model model) {
		return "chat";
	}
	@RequestMapping(value = "arrayinsert", method = RequestMethod.GET)
	public String arrayinsert(Locale locale, Model model) {
		ArrayList<String> al = new ArrayList<String>();
		al.add("1");
		al.add("3");
		//데이터 중간에 삽입하기 
		for(int i = 1; i<=50000; i=i+1) {
			al.add(1, "2");
		}
		return "chat";
	}
	
	@RequestMapping(value = "linkedinsert", method = RequestMethod.GET)
	public String linkedinsert(Locale locale, Model model) {
		List<String> al = new LinkedList<String>();
		al.add("1");
		al.add("3");
		//데이터 중간에 삽입하기 
		for(int i = 1; i<=50000; i=i+1) {
			al.add(1, "2");
		}
		return "chat";
	}
	@RequestMapping(value = "arrayread", method = RequestMethod.GET)
	public String arrayread(Locale locale, Model model) {
		List<String> al = new ArrayList<String>();
		for(int i = 0; i<50000; i=i+1) {
			al.add("1");
		}
		for(int i=0;i<al.size(); i=i+1) {
			System.out.println(al.get(i));
		}
		
		return "chat";
	}
	
	//로그 아웃은 session을 초기화하고 다른 페이지로 리다이렉트를 하면 됩니다. 
	@RequestMapping(value="logout", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
			session.invalidate();
			
		return "redirect:./";
	}
	
}





