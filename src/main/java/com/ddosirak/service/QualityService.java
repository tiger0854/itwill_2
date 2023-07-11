package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.QualityControlVO;

public interface QualityService {

	// 품질현황 목록 출력
	public List<QualityControlVO> qualityList(PageVO pageVO) throws Exception;

	public List<QualityControlVO> qualityList(PageVO pageVO, Map<String, Object> instrSearch, Model model)
			throws Exception;

	// 품질검수자 등록
	public void qualityInsert(QualityControlVO vo) throws Exception;

	// 상품목록
	public List<QualityControlVO> qualityitemList(PageVO pageVO);
	public List<EmployeeVO> employeeItemList(PageVO pageVO);

	// 상품목록 검색
	public List<QualityControlVO> qualityitemList(PageVO pageVO, Map<String, Object> instrSearch, Model model);
	public List<EmployeeVO> employeeItemList(PageVO pageVO, Map<String, Object> instrSearch, Model model);

	// 상품 검색 갯수
	public Integer itemCount(Map<String, Object> instrSearch) throws Exception;
	public Integer employeeCount(Map<String, Object> instrSearch) throws Exception;

	// 품질검사 등록
	public void insertQualityInspection(QualityControlVO vo) throws Exception;

	// 품질검사 목록
	public List<QualityControlVO> qualityInspection(PageVO pageVO) throws Exception;

	public List<QualityControlVO> qualityInspection(PageVO pageVO, Map<String, Object> instrSearch, Model model)
			throws Exception;

	// 상품 검색 갯수
	public Integer inspectionCount(Map<String, Object> instrSearch) throws Exception;

	// 불량 리스트
	public List<QualityControlVO> errorList(String wo_code, PageVO pageVO, Map<String, Object> instrSearch, Model model)
			throws Exception;

	// 불량 리스트 상태 등록
	public Integer insertStatus(QualityControlVO ivo) throws Exception;

	// 상품 검색 갯수
	public Integer errorCount(Map<String, Object> instrSearch) throws Exception;

} // interface end
