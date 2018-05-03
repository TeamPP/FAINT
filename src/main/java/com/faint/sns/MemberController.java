package com.faint.sns;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.faint.domain.UserVO;
import com.faint.dto.BlockedUserDTO;
import com.faint.dto.CustomUserDetails;
import com.faint.dto.RelationDTO;
import com.faint.service.PostService;
import com.faint.service.UserService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private UserService service;
	
	@Inject
	private PostService postService;
	// ======================================프로필 페이지 - 유저정보 읽기======================================
	
	@RequestMapping(value="/{nickname}", method=RequestMethod.GET)
	public String read(@PathVariable("nickname") String nickname, Model model, Authentication authentication) throws Exception{
		
		CustomUserDetails customUser=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)customUser.getVo();
		
		RelationDTO dto=new RelationDTO();
		dto.setLoginid(vo.getId());
		dto.setNickname(nickname);
		
		UserVO user=(UserVO)service.userRead(dto);
		
		if(user!=null && user.getBlocked()==0){
			model.addAttribute("userVO", user);
			return "forward:/member/profile";
		}else{
			return "forward:/empty";
		}
		
		
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.GET)
	public void profile(Model model, HttpServletRequest request) throws Exception{
		
	}
	
	@RequestMapping(value="/{nickname}/store", method=RequestMethod.GET)
	public String storeRead(@PathVariable("nickname") String nickname, Model model, Authentication authentication) throws Exception{
		
		CustomUserDetails user=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)user.getVo();
		
		JSONArray jsonArray=new JSONArray();
		
		//해당유저가 아니면 error페이지로 forward
		if(!( nickname.equals(vo.getNickname()))){
			return "redirect:/member/nullError";
		}
		
		RelationDTO dto=new RelationDTO();
		dto.setLoginid(vo.getId());
		dto.setNickname(nickname);
		
		model.addAttribute("userVO", service.userRead(dto));
		model.addAttribute("jsonList", jsonArray.fromObject(postService.storeRead(vo.getId())));
		return "forward:/member/store";
	}
	
	@RequestMapping(value="/store", method=RequestMethod.GET)
	public void store(Model model, HttpServletRequest request) throws Exception{

	}

	// ======================================팔로우 관련 컨트롤러======================================
	//follow 등록 - rest방식
	@RequestMapping(value="/follow/{userid}", method=RequestMethod.POST)
	public ResponseEntity<String> followStart(@PathVariable("userid") int userid, Authentication authentication) throws Exception {
		
		CustomUserDetails user=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)user.getVo();
		
		RelationDTO dto=new RelationDTO();
		dto.setLoginid(vo.getId());
		dto.setUserid(userid);
		
		ResponseEntity<String> entity=null;
		try{
			service.flwCreate(dto);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	

	//follow 삭제 - rest방식
	@RequestMapping(value="/unfollow/{userid}", method=RequestMethod.DELETE)
	public ResponseEntity<String> unfollow(@PathVariable("userid") int userid, Authentication authentication) throws Exception {
		
		CustomUserDetails user=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)user.getVo();
		
		RelationDTO dto=new RelationDTO();
		dto.setLoginid(vo.getId());
		dto.setUserid(userid);
		
		ResponseEntity<String> entity=null;
		try{
			service.flwDelete(dto);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 해당 유저가 follow하는 사람 리스트 URI
	@ResponseBody
	@RequestMapping(value="/following/{userid}", method=RequestMethod.GET)
	public ResponseEntity<List<UserVO>> flwnList(@PathVariable("userid") Integer userid, Authentication authentication) throws Exception {
		
		CustomUserDetails user=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)user.getVo();
		
		RelationDTO dto=new RelationDTO();
		dto.setLoginid(vo.getId());
		dto.setUserid(userid);
		
		ResponseEntity<List<UserVO>> entity=null;
		try{
			entity=new ResponseEntity<List<UserVO>>(service.flwnList(dto), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
		
	// 해당 유저를 follow하는 사람 리스트 URI
	@ResponseBody
	@RequestMapping(value="/followed/{userid}", method=RequestMethod.GET)
	public ResponseEntity<List<UserVO>> flwdList(@PathVariable("userid") Integer userid, Authentication authentication) throws Exception {
		
		CustomUserDetails user=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)user.getVo();
		
		RelationDTO dto=new RelationDTO();
		dto.setLoginid(vo.getId());
		dto.setUserid(userid);
		
		ResponseEntity<List<UserVO>> entity=null;
		try{
			entity=new ResponseEntity<List<UserVO>>(service.flwdList(dto), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
		
	//======================================로그인 관련 컨트롤러======================================
/*	//로그인 페이지
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto){ 
		
	}
	//로그인 페이지방향(세션의 LOGIN속성에 uservo값 추가) - login 인터셉터가 작동
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception{
		UserVO vo=service.login(dto);
		if(vo==null){
			return;
		}
		model.addAttribute("userVO", vo);
	}*/
	
	//======================================회원정보변경======================================
	//프로필편집
	@RequestMapping(value = {"/profile/edit", "/profile/passwordChange"}, method = RequestMethod.GET)
	public void profileEdit(Model model, HttpServletRequest request, Authentication authentication)throws Exception{
			
			//로그인 된 user정보 읽어들임
			CustomUserDetails customUser=(CustomUserDetails)authentication.getPrincipal();
			UserVO user=(UserVO)customUser.getVo();
			
			//유저 id로 갱신된 데이터 새로 읽기
			user = service.read(user.getId());
			logger.info(user.toString());
			model.addAttribute("userVO", user);
			model.addAttribute("reqURL", request.getRequestURI());
		
	}
		
	// 프로필 수정
	@RequestMapping(value = "/profile/edit", method = RequestMethod.POST)
	public String profileEditPOST(UserVO user, RedirectAttributes rttr) throws Exception {
		logger.info("profile edit POST..............");
		logger.info(user.toString());
		try {
			service.modify(user);
			rttr.addFlashAttribute("result", "profileEdit");
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("result", "fail");
		}
		logger.info(rttr.toString());
		return "redirect:/member/profile/edit";
	}
	
	//프로필 사진 수정
	@ResponseBody
	@RequestMapping(value = "/profile/edit/modifyPhoto", method = RequestMethod.POST)
	public int profilePhothoEdit (@RequestParam("userid") int userid, @RequestParam("fileName") String fileName) throws Exception {
		logger.info("profilePhothoEdit POST..............");
		logger.info(fileName.toString());
		return service.modifyPhoto(userid, fileName);
	}
	
	//닉네임 중복확인
	@ResponseBody
	@RequestMapping(value = "/profile/edit/chkNick", method = RequestMethod.GET)
	public int checkNickname(@RequestParam("nick") String nickname) throws Exception {
		logger.info("checkNickname...................");
		logger.info(nickname);
		return service.checkNick(nickname);
	}

	//pw중복확인
	@ResponseBody
	@RequestMapping(value = "/profile/edit/chkPW", method = RequestMethod.GET)
	public int checkPW(@RequestParam("userid") int userid, @RequestParam("pw") String pw) throws Exception {
		logger.info("checkPW...................");
		logger.info("userid : " + userid);
		return service.checkPassWord(userid, pw);
	}
	
	// 비밀번호 수정
	@RequestMapping(value = "/profile/passwordChange", method = RequestMethod.POST)
	public String passwordChangePOST(UserVO user, RedirectAttributes rttr) throws Exception {
		logger.info("profile edit POST..............");
		logger.info(user.toString());
		try {
			service.modifypassUser(user);
			rttr.addFlashAttribute("result", "passwordChange");
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("result", "fail");
		}
		logger.info(rttr.toString());
		return "redirect:/member/profile/passwordChange";
	}
	
	//======================================회원 차단======================================
	//회원차단
	@RequestMapping(value = "/block", method=RequestMethod.POST)
	public ResponseEntity<String> userBlock (@RequestParam("userid") int userid, Authentication authentication) throws Exception {
		
		CustomUserDetails customUser=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)customUser.getVo();
		
		RelationDTO dto = new RelationDTO();
		dto.setLoginid(vo.getId());
		dto.setUserid(userid);
		
		ResponseEntity<String> entity=null;
		
		try{
			service.userBlock(dto);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//회원차단해제
	@RequestMapping(value = "/unblock/{userid}", method=RequestMethod.DELETE)
	public ResponseEntity<String> userUnblock (@PathVariable("userid") int userid, Authentication authentication) throws Exception {
		
		CustomUserDetails customUser=(CustomUserDetails)authentication.getPrincipal();
		UserVO vo=(UserVO)customUser.getVo();
		
		RelationDTO dto = new RelationDTO();
		dto.setLoginid(vo.getId());
		dto.setUserid(userid);
		
		ResponseEntity<String> entity=null;
		
		try{
			service.userUnblock(dto);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//차단 목록 보기
	@RequestMapping(value = "/profile/blockedUser", method = RequestMethod.GET)
	public void blockedUser(Model model, HttpServletRequest request, Authentication authentication) throws Exception {
		logger.info("blockedUser edit GET..............");
			
		//로그인 된 user정보 읽어들임
		CustomUserDetails customUser=(CustomUserDetails)authentication.getPrincipal();
		UserVO user=(UserVO)customUser.getVo();
		
		//유저 id로 갱신된 데이터 새로 읽기
		List<BlockedUserDTO> list = service.readBlockedList(user.getId());
		model.addAttribute("blockedUserList", list);
		model.addAttribute("reqURL", request.getRequestURI());
		
	}
	
	
	
}
	
