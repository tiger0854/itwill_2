package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.domain.ProductionPerformanceVO;
import com.ddosirak.domain.QualityControlVO;
import com.ddosirak.persistance.EmployeeDAO;
import com.ddosirak.persistance.ProOrderDAO;
import com.ddosirak.persistance.ProductionPerformanceDAO;
import com.ddosirak.persistance.QualityDAO;


//@Service : 스프링(root-context.xml)에서, 해당 객체를 서비스객체로 인식하게 설정한 것!!
@Service
public class QualityServiceImpl implements QualityService {
	
	// DAO-Controller 연결
	
	// DAO 객체 접근 필요 > 의존관계!
	@Inject
	private QualityDAO qdao; // 의존성 주입

	@Override
	public List<QualityControlVO> qualityList(PageVO pageVO) throws Exception {
		return qdao.qualityList(pageVO);
	}

	@Override
	public List<QualityControlVO> qualityList(PageVO pageVO, Map<String, Object> instrSearch, Model model)
			throws Exception {
		
		return qdao.qualityList(pageVO, instrSearch, model);
	}

	@Override
	public Integer itemCount(Map<String, Object> instrSearch) throws Exception {
		return qdao.itemCount(instrSearch);
	}

	@Override
	public void insertQualityInspection(QualityControlVO vo) throws Exception {
		qdao.insertQualityInspection(vo);
		
	}

	@Override
	public List<QualityControlVO> qualityInspection(PageVO pageVO) throws Exception {
		return qdao.qualityInspection(pageVO);
	}

	@Override
	public List<QualityControlVO> qualityInspection(PageVO pageVO, Map<String, Object> instrSearch, Model model)
			throws Exception {
		return qdao.qualityInspection(pageVO, instrSearch, model);
	}

	@Override
	public Integer inspectionCount(Map<String, Object> instrSearch) throws Exception {
		return qdao.inspectionCount(instrSearch);
	}
	


} // public class end
