package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.CustomerVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;

public interface ItemdetailDAO {
	// 자재 목록
	public List<ItemdetailVO> idList(PageVO pageVO) throws Exception;

	// 자재 목록 검색
	public List<ItemdetailVO> idList(PageVO pageVO, Map<String, Object> instrSearch) throws Exception;

	// 자재 기초 등록
	public Integer insertID(ItemdetailVO vo) throws Exception;

	public String getMaxCode() throws Exception;

	// 자재 기초 수정
	public Integer updateID(ItemdetailVO vo) throws Exception;

	public ItemdetailVO selectID(String item_code) throws Exception;

	// 자재 삭제
	public void deleteI(String item_code) throws Exception;

	// 공장 검색 갯수
	public Integer itemCount(Map<String, Object> instrSearch) throws Exception;

}
