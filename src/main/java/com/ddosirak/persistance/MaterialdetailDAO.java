package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;

public interface MaterialdetailDAO {
		//자재 목록
		public List<MaterialdetailVO> mdList(PageVO pageVO) throws Exception;
		public List<MaterialdetailVO> mdList(PageVO pageVO, Map<String, Object> instrSearch) throws Exception;
		//자재 기초 등록
		public Integer insertMD(MaterialdetailVO vo) throws Exception;
		public String getMaxCode() throws Exception;
		//자재 기초 수정
		public Integer updateMD(MaterialdetailVO vo) throws Exception;
		public MaterialdetailVO selectMD(String material_code) throws Exception;
		//자재 삭제
		public void deleteM(String material_code) throws Exception;
		//자재 검색(전체조회 검색)
		public List<MaterialdetailVO> materialItemList(PageVO pageVO) throws Exception;
		//자재 검색(부분 검색)
		public List<MaterialdetailVO> materialItemList(Map<String, Object> instrSearch, PageVO pageVO) throws Exception;

		// 자재 검색 갯수
		public Integer materialCount(Map<String, Object> instrSearch) throws Exception;
		
		//자재 전체량
		public MaterialdetailVO selectTQTY(String material_code) throws Exception;
}
