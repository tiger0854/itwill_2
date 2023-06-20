package com.ddosirak.service;

import com.ddosirak.domain.BoardVO;
import com.ddosirak.domain.LoginVO;

public interface BoardService {
	// 로그인 > IDPW Check
	public LoginVO checkIDPW(LoginVO vo) throws Exception ;
	
	// 게시판 업로드
	public void writeBoard(BoardVO vo);

} // public interface end
