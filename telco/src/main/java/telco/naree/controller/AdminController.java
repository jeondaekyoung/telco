package telco.naree.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import telco.naree.domain.Access;
import telco.naree.domain.SqlSearchUsers;
import telco.naree.domain.User;
import telco.naree.exception.TelcoWebException;
import telco.naree.service.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	/**
	 * 이용자등록중 아이디 중복 조회, AJAX
	 * @param user_id
	 * @return
	 */
	@RequestMapping("searchUserId.do")
	@ResponseBody
	public boolean searchUserId(String user_id){
		boolean serarchUserIdResult = 	adminService.searchUserId(user_id);
		//System.out.println(user_id + "는 " + "*" + serarchUserIdResult + "*");
		return serarchUserIdResult;
	}
	
	/**
	 * 이용자 등록하기
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "registerUser.do", method = RequestMethod.POST)
	public String registerUser(User user, HttpSession session, Model model){
		//System.out.println((String)session.getAttribute("schoolName"));
		user.setSchool_name((String)session.getAttribute("schoolName"));
		
		//System.out.println(user.toString());
		adminService.registerUser(user);
		model.addAttribute("registerResult", true);
		return "admin/register";
	}
	
	/**
	 * 이용자 검색하기
	 * @param searchTerms
	 * @param startDay
	 * @param endDay
	 * @param usersName
	 * @return
	 */
	@RequestMapping(value = "searchUsers.do")
	public String searchUsers(String searchTerms, String startDay, String endDay, String usersName, Model model){
		List<SqlSearchUsers> users = adminService.searchUsers(searchTerms, startDay, endDay, usersName);
		model.addAttribute("users", users);		
		return "admin/search";
	}
	
	/**
	 * 이용자 정보 검색하기
	 * @param user_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "information.do")
	public String information(String user_id, Model model){
		//user 정보 검색
		User user = adminService.infoUser(user_id);
		model.addAttribute("user", user);
		//user 접속 정보 검색
		List<Access> accesss = adminService.infoAccess(user_id);
		model.addAttribute("accesss", accesss);
		
		return "admin/info";
	}
	
	
	/**
	 * 비밀번호 초기화하기
	 * @param user_id
	 * @param user_pw
	 * @param user_pw1
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "pwInit.do",  method = RequestMethod.POST)
	public String pwInit(String user_id, String user_pw, String user_pw1, Model model){
		System.out.println("/ " + user_id + " / " + user_pw + " / " + user_pw1 + " /");
		if(!user_pw.equals(user_pw1)){
			throw new TelcoWebException("새 비밀번호와 새 비밀번호 확인과 다릅니다.");
		}
		
		adminService.pwInit(user_id, user_pw);
		//user 정보 검색
		User user = adminService.infoUser(user_id);
		model.addAttribute("user", user);
		//user 접속 정보 검색
		List<Access> accesss = adminService.infoAccess(user_id);
		model.addAttribute("accesss", accesss);
		
		return "admin/info";
	}
	
	/**
	 * 이용자 정보 수정하기
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "modifyUser.do", method = RequestMethod.POST)
	public String modifyUser(User user, Model model){
		System.out.println(user.toString());
		
		adminService.modifyUser(user);
		
		//user 정보 검색
		User newUser = adminService.infoUser(user.getUser_id());
		model.addAttribute("user", newUser);
		//user 접속 정보 검색
		List<Access> accesss = adminService.infoAccess(user.getUser_id());
		model.addAttribute("accesss", accesss);		
		return "admin/info";
	}
	
	/**
	 * 관리자 페이지 이동, '이용자 등록','이용자 검색','이용자 정보'
	 * @param session
	 * @return
	 */
	@RequestMapping("register.do")
	public String register(HttpSession session){
		String user_sepa = (String)session.getAttribute("userSepa");
		//System.out.println("*" + user_sepa + "*");
		if(!user_sepa.equals("교사")) {
			throw new TelcoWebException("교사가 아닙니다.");
		}
		return "admin/register";
	}
	@RequestMapping("search.do")
	public String search(HttpSession session){
		String user_sepa = (String)session.getAttribute("userSepa");
		//System.out.println("*" + user_sepa + "*");
		if(!user_sepa.equals("교사")) {
			throw new TelcoWebException("교사가 아닙니다.");
		}
		return "admin/search";
	}	
	@RequestMapping("info.do")
	public String info(HttpSession session){
		String user_sepa = (String)session.getAttribute("userSepa");
		//System.out.println("*" + user_sepa + "*");
		if(!user_sepa.equals("교사")) {
			throw new TelcoWebException("교사가 아닙니다.");
		}
		return "admin/info";
	}	

}
