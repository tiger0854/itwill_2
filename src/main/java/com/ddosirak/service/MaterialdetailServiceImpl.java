package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ddosirak.codeBulider.CodeBuilder;
import com.ddosirak.codeBulider.CodeBuilder.ServiceName;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.persistance.MaterialdetailDAO;

@Service
public class MaterialdetailServiceImpl implements MaterialdetailService {
	
	@Inject
	MaterialdetailDAO dao;
	
	public static final Logger logger = LoggerFactory.getLogger(MaterialdetailServiceImpl.class);
	
	@Override
	public List<MaterialdetailVO> mdList() {
		logger.debug("service : 자재 목록 호출");
		List<MaterialdetailVO> resultlist=dao.mdList();
		logger.debug("service : 자재 목록 완료");
		return resultlist;
	}

	@Override
	public Integer insertMD(MaterialdetailVO vo) {
		logger.debug("service : 자재 등록 호출");
		CodeBuilder cb = new CodeBuilder();
		vo.setMaterial_code(cb.FoundationCodeBuilder(ServiceName.MATERIALDETAIL));
		logger.debug(vo+"");
		int result=dao.insertMD(vo);
		return result;
	}

	@Override
	public Integer updateMD(MaterialdetailVO vo) {
		logger.debug("service : 자재 수정 호출 (update)");
		int result=dao.updateMD(vo);
		return result;
	}

	@Override
	public MaterialdetailVO editMD(String material_code) {
		logger.debug("service : 자재 수정 호출 (edit)");
		logger.debug("service : 파라미터 확인 "+ material_code);
		MaterialdetailVO resultvo=dao.editMD(material_code);
		return resultvo;
	}

	@Override
	public void deleteM(String material_code) {
		logger.debug("service : 자재 삭제 호출");
		dao.deleteM(material_code);
	}

}
