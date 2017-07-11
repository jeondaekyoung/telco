package telco.naree.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import telco.naree.domain.Access;
import telco.naree.domain.User;
import telco.naree.exception.TelcoWebException;
import telco.naree.service.CommonService;
import telco.naree.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private CommonService commonService;
	
	
	/**
	 * 학생 가입
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "join_s.do", method = RequestMethod.POST)
	public String join_s(User user, HttpSession session){
		user.setUser_sepa("학생");
		//학교가 존재하는지 검색하여
		//학교가 없으면 학교를 저장한다.
		commonService.searchSchool(user.getSchool_name());
		
		//학생저장하기
		boolean resultJoin = userService.join(user);
		if(resultJoin == false) {
			/*System.out.println("존재하는 이용자아이디입니다.");
			session.setAttribute("errorMsg", "존재하는 이용자아이디입니다.");
			return "user/join_s";*/
			
			session.setAttribute("errorMsg", "존재하는 이용자아이디입니다.");
			throw new TelcoWebException("존재하는 이용자아이디입니다.");
		} else {
			session.setAttribute("userName", user.getUser_name());
			session.setAttribute("schoolName",user.getSchool_name());
			return "main";
		}
	}
	
	/**
	 * 교사 가입
	 * @param user
	 * @param session
	 * @return
	 */
	/*@RequestMapping(value = "join_t.do", method = RequestMethod.POST)
	public String join_t(String user_id, String user_pw, String user_name, String email_address, String school_name,
			String charge_or, int grade, String affiliation, int ban, HttpSession session){
		User user = new User();
		user.setUser_sepa("교사");
		user.setUser_id(user_id);
		user.setUser_pw(user_pw);
		user.setUser_name(user_name);
		user.setEmail_address(email_address);
		user.setSchool_name(school_name);
		user.setCharge_or(charge_or);
		user.setGrade(grade);
		user.setAffiliation(affiliation);
		user.setBan(ban);
		System.out.println(user.toString());
		
		//학교가 존재하는지 검색하여
		//학교가 없으면 학교를 저장한다.
		commonService.searchSchool(user.getSchool_name());
		
		//교사저장하기
		boolean resultJoin = userService.join(user);
		if(resultJoin == false) {
			session.setAttribute("errorMsg", "존재하는 이용자아이디입니다.");
			return "user/join_t";
		} else {
			session.setAttribute("userName", user.getUser_name());
			session.setAttribute("schoolName",user.getSchool_name());
			return "main";
		}
		return "main";
	}*/
	@RequestMapping(value = "join_t.do", method = RequestMethod.POST)
	public String join_t(String user_id, String user_pw, String user_name, String email_address, String school_name,
			String charge_or, String grade, String affiliation, String ban, HttpSession session){
		User user = new User();
		user.setUser_sepa("교사");
		user.setUser_id(user_id);
		user.setUser_pw(user_pw);
		user.setUser_name(user_name);
		user.setEmail_address(email_address);
		user.setSchool_name(school_name);
		user.setCharge_or(charge_or);
		if(!grade.equals("")){
			user.setGrade(grade);
		}
		user.setAffiliation(affiliation);
		if(!ban.equals("")){
			user.setBan(ban);
		}
		System.out.println(user.toString());
		
		//학교가 존재하는지 검색하여
		//학교가 없으면 학교를 저장한다.
		commonService.searchSchool(user.getSchool_name());
		
		//교사저장하기
		boolean resultJoin = userService.join(user);
		if(resultJoin == false) {
			session.setAttribute("errorMsg", "존재하는 이용자아이디입니다.");
			return "user/join_t";
		} else {
			session.setAttribute("userName", user.getUser_name());
			session.setAttribute("schoolName",user.getSchool_name());
			return "main";
		}
	}
	
	/**
	 * 로그인
	 * @param user_id
	 * @param user_pw
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(String user_id, String user_pw, HttpSession session, HttpServletRequest request){
		//이용자 로그인
		User user = userService.login(user_id, user_pw);
		session.setAttribute("userName", user.getUser_name());
		session.setAttribute("userSepa", user.getUser_sepa());
		session.setAttribute("schoolName",user.getSchool_name());
		session.setAttribute("userId", user.getUser_id());
		//System.out.println(user.getUser_sepa());
		
		//로그인 정보 저장하기
		//저장할 정보를 만들어서 넘겨주어야한다.
		//Access의 ip, device, user_id
		String ip = request.getRemoteAddr();
		String agent = request.getHeader("USER-AGENT");
		String[] mobileos = {"iPhone", "iPod", "Android", "BlackBerry", "Windows CE", "Nokia", "Webos", "Opera Mini", "SonyEricsson", "Opera Mobi", "IEMobile"};
		String device = "컴퓨터";
		int j = -1;
		for(int i=0; i<mobileos.length; i++){
			j = agent.indexOf(mobileos[i]);
			if(j>-1){
				device = "모바일";
				break;
			}
		}
		Access access = new Access();
		access.setIp(ip);
		access.setDevice(device);
		access.setUser_id(user_id);
		userService.registerAccess(access);
		
		return "main";
	}
	
	/**
	 * 로그아웃합니다. 세션 지우기
	 * @param session
	 * @return
	 */
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃되었습니다.");
		return "user/login";
	}
	
}
