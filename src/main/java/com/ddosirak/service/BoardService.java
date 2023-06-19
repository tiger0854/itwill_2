package com.ddosirak.service;

import com.ddosirak.domain.LoginVO;

public interface BoardService {
	// 로그인 > IDPW Check
	public LoginVO checkIDPW(LoginVO vo);

} // public interface end
