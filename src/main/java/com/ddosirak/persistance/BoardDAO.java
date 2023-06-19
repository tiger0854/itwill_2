package com.ddosirak.persistance;

import com.ddosirak.domain.LoginVO;

public interface BoardDAO {
	
	// 로그인 > IDPW Check
	public LoginVO checkIDPW(LoginVO vo);

} // public interface end
