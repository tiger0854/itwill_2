package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.ProOrderVO;
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
	public List<ProOrderVO> proOrderList() {
		// TODO Auto-generated method stub
		return odao.proOrderList();
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
	
	
	


} // public class end
