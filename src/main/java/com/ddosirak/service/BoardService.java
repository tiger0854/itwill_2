package com.ddosirak.service;

import java.util.List;

import com.ddosirak.domain.BoardVO;
import com.ddosirak.domain.LoginVO;

public interface BoardService {
	// 로그인 > IDPW Check
	public LoginVO checkIDPW(LoginVO vo) throws Exception ;
	
	// 게시판 업로드
	public void writeBoard(BoardVO vo);
	//게시판 리스트 가져오기
	public List<BoardVO> getBoardList();
	//게시판 글 정보 조회
	public BoardVO getContent(int emp_bno);

} // public interface end
