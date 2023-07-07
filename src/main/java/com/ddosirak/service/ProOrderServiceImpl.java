package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.GraphVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.domain.ProductionPerformanceVO;
import com.ddosirak.persistance.EmployeeDAO;
import com.ddosirak.persistance.ProOrderDAO;


//@Service : 스프링(root-context.xml)에서, 해당 객체를 서비스객체로 인식하게 설정한 것!!
@Service
public class ProOrderServiceImpl implements ProOrderService {
	
	// DAO-Controller 연결
	
	// DAO 객체 접근 필요 > 의존관계!
	@Inject
	private ProOrderDAO odao; // 의존성 주입

	@Override
	public void orderInsert(ProOrderVO vo) {
		odao.insertOrder(vo);
		
	}

	@Override
	public List<ProOrderVO> proOrderList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return odao.proOrderList(pageVO);
	}


	@Override
	public List<ProOrderVO> proOrderList(Map<String, Object> instrSearch, Model model,PageVO pageVO) {
		// 작업지시 검색 목록
		System.out.println("InstructServiceImpl instrList 검색");
		
//		int totalCnt = instructDAO.instrCount(instrSearch);
//		PageUtil.getPaging(pageDTO, model, totalCnt);
		
		return odao.proOrderList(instrSearch,model,pageVO);
	}
	
	
	@Override
	public ProOrderVO getProOder(String wo_code) {
		ProOrderVO resultVO = odao.getProOrder(wo_code);
		return resultVO;
	}

	@Override
	public Integer EditProOrder(ProOrderVO vo) {
		
		return odao.EditProOrder(vo);
	}

	@Override
	public void deleteProOrder(String wo_code) {
		odao.deleteProOrder(wo_code);
	}

//	@Override
//	public Integer statusProOrder(ProductionPerformanceVO vo) {
//		return odao.statusProOrder(vo);
//	}

	@Override
	public List<ItemdetailVO> proitemList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return odao.proitemList(pageVO);
	}

	@Override
	public List<ItemdetailVO> proitemList(PageVO pageVO,Map<String, Object> instrSearch, Model model) {
		// TODO Auto-generated method stub
		return odao.proitemList(pageVO,instrSearch,model);
	}

	@Override
	public void addpQTY(ProductionPerformanceVO ivo) {
		odao.addpQTY(ivo);
	}

	//작업지시 검색갯수
	@Override
	public Integer ProOrdercount(Map<String, Object> instrSearch) {
		return odao.ProOdercount(instrSearch);
	}

	@Override
	public Integer itemcount(Map<String, Object> instrSearch) {
		// TODO Auto-generated method stub
		return odao.itemCount(instrSearch);
	}

	@Override
	public List<Map<String, Object>> graphList() {
		// TODO Auto-generated method stub
		return odao.graphList();
	}

	
	
	


} // public class end
