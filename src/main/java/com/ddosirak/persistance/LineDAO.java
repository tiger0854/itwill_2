package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.LineVO;
import com.ddosirak.domain.ProOrderVO;

public interface LineDAO {

	
	//라인목록
	public List<LineVO> LineList();
	
	//라인검색
	public List<LineVO> LineList(Map<String, Object> instrSearch, Model model);
	
	//라인등록
	public void addLine(LineVO vo); 
	
	//라인조회
	public LineVO getLine(String line_code); 
	
	//라인수정
	public Integer editline(LineVO vo);
	
	//라인삭제
	public void lineDelete(String line_code);
	
}
