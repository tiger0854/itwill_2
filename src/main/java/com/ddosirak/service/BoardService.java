package com.ddosirak.service;

import java.util.List;

import com.ddosirak.domain.BoardVO;
import com.ddosirak.domain.ChatRoomVO;
import com.ddosirak.domain.ChatVO;
import com.ddosirak.domain.EmployeeCheckVO;
import com.ddosirak.domain.LoginVO;
import com.ddosirak.domain.PageVO;

public interface BoardService {
	// 로그인 > IDPW Check
	public LoginVO checkIDPW(LoginVO vo) throws Exception ;
	// 출근
	public void employeeIn(EmployeeCheckVO vo) throws Exception;
	//퇴근
	public void employeeOut(EmployeeCheckVO vo) throws Exception;
	// 퇴근시 일용직 퇴사처리
	public Integer al_out(int employee_id) throws Exception;
	// 출퇴근 리스트
	public List<EmployeeCheckVO> getInOutList(int employee_id) throws Exception;
	
	// 게시판 업로드
	public void writeBoard(BoardVO vo)throws Exception;
	//게시판 리스트 가져오기
	public List<BoardVO> getBoardList(PageVO pageVO) throws Exception;
	//게시판 글 정보 조회
	public BoardVO getContent(int emp_bno) throws Exception;
	//게시판 글 정보 수정
	public void contentUpdate(BoardVO vo) throws Exception;
	//게시판 글 삭제
	public void deleteContent(int emp_bno) throws Exception;

	
	// 채팅
	// 채팅 입력
	public void chatSend(ChatVO chatVO) throws Exception;
	// 채팅 리스트 출력
	public List<ChatVO> chatList(String login_id) throws Exception;
	// 채팅방 출력
	public List<String> chatRoom(String login_id) throws Exception;
	// 채팅방 가져오기
	public ChatRoomVO getChatRoom(String chatRoom_code) throws Exception;
	// 채팅방 생성
	public void chatRoomMake(String chatRoom_code) throws Exception;
	// 채팅칠때 최근 채팅 일시 입력
	public void chatDateUpdate(ChatVO chatVO) throws Exception;
	// 채팅방의 채팅 내역 가져오기
	public List<ChatVO> getChatList(String chatRoom_code) throws Exception;
	
	
} // public interface end
