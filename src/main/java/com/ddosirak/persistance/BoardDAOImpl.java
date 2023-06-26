package com.ddosirak.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.BoardVO;
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
	
	
	
	

	
	
	
}// public class end
