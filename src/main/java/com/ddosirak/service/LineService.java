package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.LineVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;

public interface LineService {

	//전체라인
	public List<LineVO> LineList();
	
	//라인목록
	public List<LineVO> LineList(PageVO pageVO);
	
	//라인검색
	public List<LineVO> LineList(Map<String, Object> instrSearch, Model model, PageVO pageVO);

	
	//라인등록
	public void addLine(LineVO vo);

	//라인조회
	public LineVO getLine(String line_code); 
	
	//라인수정
	public Integer editline(LineVO vo);
	
	//라인삭제
	public void deleteLine(String line_code);

	//라인갯수
	public Integer getLinecount(Map<String, Object> instrSearch);

	
	
}
