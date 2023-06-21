package com.ddosirak.persistance;

import java.util.List;

import com.ddosirak.domain.BoardVO;
import com.ddosirak.domain.LoginVO;
import com.ddosirak.domain.PageVO;

public interface BoardDAO {
	
	// 로그인 > IDPW Check
	public LoginVO checkIDPW(LoginVO vo) throws Exception;
	
	// 게시판 업로드
	public void writeBoard(BoardVO vo);
	//게시판 리스트 가져오기
	public List<BoardVO> getBoardList(PageVO pageVO);
	//게시판 글 정보 조회
	public BoardVO getContent(int emp_bno);
	//게시판 글 정보 수정
	public void contentUpdate(BoardVO vo);
	//게시판 글 삭제
	public void deleteContent(int emp_bno);

} // public interface end
