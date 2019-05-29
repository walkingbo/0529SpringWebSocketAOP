package kr.co.pk.domain;

import lombok.Data;
//lombok의 어노테이션으로 접근자 메소드, toString을 자동으로 생성해주는 어노테이션 
@Data
public class Register1 {
	private String userid;
	private String userpw;
	private String username;
	private String nickname;
}
