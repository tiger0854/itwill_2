package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.LineVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;

@Repository
public class LineDAOImpl implements LineDAO{

	private static final String NAMESPACE="com.ddosirak.mapper.LineMapper";
	
	private static final Logger logger=org.slf4j.LoggerFactory.getLogger(LineDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<LineVO> LineList() {
		logger.debug("proitemList()");
		List<LineVO> lineList = sqlSession.selectList(NAMESPACE+".LineListAll");
		return lineList;
	}
	
	@Override
	public List<LineVO> LineList(PageVO pageVO) {
		logger.debug("proitemList()");
		List<LineVO> lineList = sqlSession.selectList(NAMESPACE+".LineList",pageVO);
		return lineList;
	}
	
	@Override
	public List<LineVO> LineList(Map<String, Object> instrSearch, Model model,PageVO pageVO) {
		// 작업지시 조회 목록
		logger.debug("proOrderList()!");
		instrSearch.put("startRow", pageVO.getStartRow());
		instrSearch.put("pageSize", pageVO.getPageSize());
//		System.out.println("작업지시 페이징 : " + instrSearch);
		List<LineVO> lineList = sqlSession.selectList(NAMESPACE+".lineSearch",instrSearch);
		return lineList;
	} 

	@Override
	public void addLine(LineVO vo) {
		sqlSession.insert(NAMESPACE+".lineAdd", vo); // ". 주의 !!"
		logger.debug("라인등록 완료!");

	}

	@Override
	public LineVO getLine(String line_code) {
		logger.debug("getProdoer()!");
		LineVO resultVO = sqlSession.selectOne((NAMESPACE)+".getLine", line_code);
		return resultVO;
	}

	@Override
	public Integer editline(LineVO vo) {
		logger.debug("editline() !");
		Integer result = sqlSession.selectOne(NAMESPACE+".editLine",vo);
		return result;
		
	}

	//라인삭제
	@Override
	public void lineDelete(String line_code) {
		logger.debug("dao: 라인지시 삭제 호출");
		sqlSession.delete(NAMESPACE+".deleteLine",line_code);
		
	}

	@Override
	public Integer lineCount(Map<String, Object> instrSearch) {
		logger.debug("lineCount");
		return sqlSession.selectOne(NAMESPACE+".linecount",instrSearch);
	}


	
	
}
