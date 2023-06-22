package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.IntegrationCodeVO;
import com.ddosirak.domain.MaterialsVO;
import com.ddosirak.persistance.MaterialsDAO;

@Service
public class MaterialsServiceImpl implements MaterialsService {

	// DAO-Controller 연결

	// DAO 객체 접근 필요 > 의존관계!
	@Inject
	private MaterialsDAO mdao; // 의존성 주입

	@Override
	public void matInputInsert(MaterialsVO ivo) {
		mdao.insertMatInput(ivo);
	}

	@Override
	public List<MaterialsVO> matInputList() {
		return mdao.inputMaterialList();
	}

	@Override
	public Integer matInputEdit(MaterialsVO uvo) {
		return mdao.updateMatInput(uvo);
	}

	@Override
	public MaterialsVO getMatInput(String material_code) {
		return mdao.getMatInput(material_code);
	}

	@Override
	public void RemoveMatInput(String material_code) {
		mdao.deleteMatInput(material_code);
	}

	@Override
	public List<IntegrationCodeVO> matInputItemList() {
		return mdao.matInputItemList();
	}
	
	
	
	
	
	

}
