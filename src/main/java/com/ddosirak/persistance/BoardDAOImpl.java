package com.ddosirak.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.BoardVO;
import com.ddosirak.domain.ChatRoomVO;
import com.ddosirak.domain.ChatVO;
import com.ddosirak.domain.EmployeeCheckVO;
import com.ddosirak.domain.LoginVO;
import com.ddosirak.domain.PageVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	private static final String NAMESPACE="com.ddosirak.mapper.PublicMapper";
	@Inject
	private SqlSession sqlSession;
	//=================================로그인/근태====================================================
	// 로그인 > IDPW Check
	@Override
	public LoginVO checkIDPW(LoginVO vo) throws Exception {
		logger.debug("checkIDPW() 메서드 호출!");
		LoginVO lvo = sqlSession.selectOne(NAMESPACE+".checkIDPW", vo);
		return lvo;
	}// checkIDPW() method end

	// 출근
	@Override
	public void employeeIn(EmployeeCheckVO vo) throws Exception {
		logger.debug("employeeIn() 메서드 호출!");
		sqlSession.insert(NAMESPACE+".employeeIn", vo);
	}// employeeIn() method end
	// 퇴근
	@Override
	public void employeeOut(EmployeeCheckVO vo) throws Exception {
		logger.debug("employeeOut() 메서드 호출!");
		sqlSession.insert(NAMESPACE+".employeeOut", vo);
	}// employeeOut() method end
	// 퇴근시 일용직 퇴사처리
	@Override
	public Integer al_out(int employee_id) throws Exception {
		logger.debug("employeeOut() 메서드 호출!");
		return sqlSession.update(NAMESPACE+".al_out", employee_id);
	}// al_out() method end
	// 출퇴근 리스트
	@Override
	public List<EmployeeCheckVO> getInOutList(int employee_id) throws Exception {
		logger.debug("getInOutList() 메서드 호출!");
		return sqlSession.selectList(NAMESPACE+".getInOutList",employee_id);
	}//getInOutList() method end
	
	//=================================로그인/근태====================================================
	


	//=================================게시판====================================================
	// 게시판 업로드
	@Override
	public void writeBoard(BoardVO vo) throws Exception{
		logger.debug("writeBoard() 메서드 호출!");
		sqlSession.insert(NAMESPACE+".writeBoard",vo);
	}// writeBoard() method end
	
	// 게시판 리스트 가져오기
	@Override
	public List<BoardVO> getBoardList(PageVO pageVO) throws Exception{
		logger.debug("getBoardList() 메서드 호출!");
		return sqlSession.selectList(NAMESPACE+".getBoardList",pageVO);
	}// getBoardList() method end

	//글 정보 가져오기
	@Override
	public BoardVO getContent(int emp_bno) throws Exception{
		logger.debug("getContent() 메서드 호출!");
		return sqlSession.selectOne(NAMESPACE+".getContent", emp_bno);
	}// getContent() method end

	// 글 정보 수정
	@Override
	public void contentUpdate(BoardVO vo) throws Exception{
		logger.debug("contentUpdate() 메서드 호출!");
		sqlSession.selectOne(NAMESPACE+".updateContent", vo);
	}// contentUpdate() method end

	// 글 삭제
	@Override
	public void deleteContent(int emp_bno) throws Exception{
		logger.debug("deleteContent() 메서드 호출!");
		sqlSession.delete(NAMESPACE+".deleteContent", emp_bno);
	}// deleteContent() method end
	//=================================게시판====================================================


	//=================================사내메신저====================================================
	// 채팅 입력
	@Override
	public void chatSend(ChatVO chatVO) throws Exception {
		logger.debug("chatSend() 메서드 호출!");
		sqlSession.insert(NAMESPACE+".chatSend",chatVO);
	}// chatSend() method end

	// 채팅 리스트 출력
	@Override
	public List<ChatVO> chatList(String login_id) throws Exception {
		logger.debug("chatList() 메서드 호출!");
		return sqlSession.selectList(NAMESPACE+".getChatList",login_id);
	}// chatList() method end
	
	// 채팅방 출력
	@Override
	public List<String> chatRoom(String login_id) throws Exception {
		logger.debug("chatRoom() 메서드 호출!");
		return sqlSession.selectList(NAMESPACE+".getChatRoom",login_id);
	}//chatRoom() method end
	
	// 채팅방 가져오기
	@Override
	public ChatRoomVO getChatRoom(String chatRoom_code) throws Exception {
		logger.debug("getChatRoom() 메서드 호출!");
		return sqlSession.selectOne(NAMESPACE+".getOneChatRoom",chatRoom_code);
	}

	// 채팅방 생성
	@Override
	public void chatRoomMake(String chatRoom_code) throws Exception {
		logger.debug("chatRoomMake() 메서드 호출!");
		sqlSession.insert(NAMESPACE+".makeChatRoom",chatRoom_code);
	}// chatRoomMake() method end

	// 채팅칠때 최근채팅일자 입력
	@Override
	public void chatDateUpdate(ChatVO chatVO) throws Exception {
		logger.debug("chatDateUpdate() 메서드 호출!");
		sqlSession.update(NAMESPACE+".lastChatDate",chatVO);
	}// chatDateUpdate() method end
	// 채팅방의 채팅 내역 가져오기
	@Override
	public List<ChatVO> getChatList(String chatRoom_code) throws Exception {
		logger.debug("getChatList() 메서드 호출!");
		return sqlSession.selectList(NAMESPACE+".getChatListAll",chatRoom_code);
	}// getChatList() method end
	
	
	
	
	
	
	//=================================사내메신저====================================================

	
}// public class end

































