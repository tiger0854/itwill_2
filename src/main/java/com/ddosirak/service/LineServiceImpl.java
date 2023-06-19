package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ddosirak.domain.LineVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.persistance.LineDAO;
import com.ddosirak.persistance.ProOrderDAO;

@Service
public class LineServiceImpl implements LineService{

	@Inject
	private LineDAO ldao; // 의존성 주입
	
	//라인목록
	@Override
	public List<LineVO> LineList() {
		return ldao.LineList();
	}
	
	//라인검색
	@Override
	public List<LineVO> LineList(Map<String, Object> instrSearch, Model model) {
		return ldao.LineList(instrSearch, model);
	}

	//라인등록
	@Override
	public void addLine(LineVO vo) {
		ldao.addLine(vo);;
	}

	@Override
	public LineVO getLine(String line_code) {
		LineVO resultVO = ldao.getLine(line_code);
		return resultVO;
	}

	@Override
	public Integer editline(LineVO vo) {
		return ldao.editline(vo);
	}

	@Override
	public void deleteLine(String line_code) {
		ldao.lineDelete(line_code);
	}



}
