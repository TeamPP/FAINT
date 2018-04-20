package util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
/*
 *회원가입 시 로그인
 *비밀번호 시큐리티 
 *암호화 하는 역
 * 
 * 
 * */
@Component
public class PasswordUtil implements PasswordEncoder {

	// 멤버필드
	private BCryptPasswordEncoder encoder;
	
	// 생성자
	public PasswordUtil() {
		encoder = new BCryptPasswordEncoder();
	}
	
	@Override
	public String encode(CharSequence pwd) {
		String hash = encoder.encode(pwd);
		return hash;
	}
	
	// 입력한 문자열과 암호화된 문자열이 일치하는지 여부를 리턴하는 메소드
	@Override
	public boolean matches(CharSequence pwd, String hash) {
		// 일치 여부를 boolean type으로 얻어내기
		boolean isMatch = encoder.matches(pwd, hash);
		return isMatch;
	}

}
