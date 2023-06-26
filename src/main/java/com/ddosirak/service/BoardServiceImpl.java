package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.BoardVO;
import com.ddosirak.domain.LoginVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.persistance.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO bdao;
	
	// 로그인 > IDPW Check
	@Override
	public LoginVO checkIDPW(LoginVO vo) throws Exception{
		LoginVO resultVO = bdao.checkIDPW(vo);
		return resultVO;
	}// checkIDPW() method end

	// 게시판 업로드 동작
	@Override
	public void writeBoard(BoardVO vo) {
		bdao.writeBoard(vo);
	}// writeBoard() method end

	// 게시판 리스트 조회
	@Override
	public List<BoardVO> getBoardList(PageVO pageVO) {
		return bdao.getBoardList(pageVO);
	}// getBoardList() method end
	
	// 글 정보 조회
	@Override
	public BoardVO getContent(int emp_bno) {
		return bdao.getContent(emp_bno);
	}// getContent() method end

	// 글 정보 수정
	@Override
	public void contentUpdate(BoardVO vo) {
		bdao.contentUpdate(vo);
	}// contentUpdate() method end

	// 글 삭제
	@Override
	public void deleteContent(int emp_bno) {
		bdao.deleteContent(emp_bno);
	}// deleteContent() method end
	


}// public class end
