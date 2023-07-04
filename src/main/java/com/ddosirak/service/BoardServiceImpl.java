package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.BoardVO;
import com.ddosirak.domain.ChatVO;
import com.ddosirak.domain.EmployeeCheckVO;
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
	// 출근
	@Override
	public void employeeIn(EmployeeCheckVO vo) throws Exception {
		bdao.employeeIn(vo);
	}// employeeIn() method end
	// 퇴근
	@Override
	public void employeeOut(EmployeeCheckVO vo) throws Exception {
		bdao.employeeOut(vo);
	}// employeeIn() method end
	// 퇴근시 일용직 퇴사처리
	@Override
	public Integer al_out(int employee_id) throws Exception {
		return bdao.al_out(employee_id);
	}//al_out() method end
	// 출퇴근 리스트
	@Override
	public List<EmployeeCheckVO> getInOutList(int employee_id) throws Exception {
		return bdao.getInOutList(employee_id);
	}//getInOutList() method end
	
	
	
	// 게시판 업로드 동작
	@Override
	public void writeBoard(BoardVO vo) throws Exception{
		bdao.writeBoard(vo);
	}// writeBoard() method end

	// 게시판 리스트 조회
	@Override
	public List<BoardVO> getBoardList(PageVO pageVO) throws Exception{
		return bdao.getBoardList(pageVO);
	}// getBoardList() method end
	
	// 글 정보 조회
	@Override
	public BoardVO getContent(int emp_bno) throws Exception{
		return bdao.getContent(emp_bno);
	}// getContent() method end

	// 글 정보 수정
	@Override
	public void contentUpdate(BoardVO vo) throws Exception{
		bdao.contentUpdate(vo);
	}// contentUpdate() method end

	// 글 삭제
	@Override
	public void deleteContent(int emp_bno) throws Exception{
		bdao.deleteContent(emp_bno);
	}// deleteContent() method end
	
	// 채팅
	// 채팅 전송
	@Override
	public void chatSend(ChatVO chatVO) throws Exception {
		bdao.chatSend(chatVO);
	}// chatSend() method end
	// 채팅 리스트 출력
	@Override
	public List<ChatVO> chatList(String login_id) throws Exception {
		return bdao.chatList(login_id);
	}// chatList() method end
	// 채팅방 코드 출력
	@Override
	public List<String> chatRoom(String login_id) throws Exception {
		return bdao.chatRoom(login_id);
	}// chatRoom() method end
	
	

	


}// public class end
