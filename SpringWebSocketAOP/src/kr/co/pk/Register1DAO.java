package kr.co.pk;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.pk.domain.Register1;

@Repository
public class Register1DAO {
	@Autowired
	private SqlSession sqlSession;
	
	//로그인 처리 메소드
	public Register1 login(Register1 register1) {
		return sqlSession.selectOne("register1.login",register1);
	}
}
