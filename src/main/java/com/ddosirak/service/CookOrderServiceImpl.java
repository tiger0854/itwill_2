package com.ddosirak.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ddosirak.domain.CookAddVO;
import com.ddosirak.domain.CookListVO;
import com.ddosirak.domain.CookVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.domain.ProductionPerformanceVO;
import com.ddosirak.persistance.CookOrderDAO;
import com.ddosirak.persistance.EmployeeDAO;
import com.ddosirak.persistance.ProOrderDAO;


//@Service : 스프링(root-context.xml)에서, 해당 객체를 서비스객체로 인식하게 설정한 것!!
@Service
public class CookOrderServiceImpl implements CookOrderService {
	
	// DAO-Controller 연결
	public static final Logger logger = LoggerFactory.getLogger(CookOrderServiceImpl.class);

	// DAO 객체 접근 필요 > 의존관계!
	@Inject
	private ProOrderDAO odao; // 의존성 주입
	@Inject
	private CookOrderDAO cdao;

	@Override
	public void cookorderInsert(CookVO cvo,CookListVO lcvo) {
		
		 List<CookVO> cookListvo = lcvo.getCookListvo(); // ItemRecipeUploadVO 객체에서 리스트를 가져옴
		 Iterator<CookVO> iterator = cookListvo.iterator(); // Iterator 객체 생성

		    while (iterator.hasNext()) {
		    	CookVO item = iterator.next();
		        item.setItem_code(cvo.getItem_code());
		        item.setItem_name(cvo.getItem_name());// 값을 설정
		        item.setCoQTY(cvo.getCoQTY());
		        item.setCpQTY(cvo.getCpQTY());
		        item.setLine_code(cvo.getLine_code());
		        item.setLine_name(cvo.getLine_name());
		        item.setEmployee_name(cvo.getEmployee_name());
		        item.setSo_code(cvo.getSo_code());
		        cdao.cookOrder(item);
//		            dao.insertOrUpdateItemRecipe(item); // 변경된 ItemRecipeVO 객체를 사용하여 레시피 등록
		    }
			
		
	}


	@Override
	public List<CookVO> cookOrderList(PageVO pageVO) {
		return cdao.cookOrderList(pageVO);
	}
	
	//조리지시 목록
	@Override
	public Integer cookOrdercount(Map<String, Object> instrSearch) {
		
		return cdao.cookOrdercount(instrSearch);
	}
	
	
	@Override
	public List<CookVO> cookOrderList(Map<String, Object> instrSearch, Model model,PageVO pageVO) {
		// 조리지시 검색 목록

//		int totalCnt = instructDAO.instrCount(instrSearch);
//		PageUtil.getPaging(pageDTO, model, totalCnt);
		
		return cdao.cookOrderList(instrSearch,model,pageVO);
	}
	
	//조리지시수정
	@Override
	public Integer EditcookOrder(CookVO cvo) {
		return cdao.EditcookOrder(cvo);
	}

	//조리지시삭제
	@Override
	public void deletecookOrder(String co_code) {
		cdao.deletecookOrder(co_code);
	}
	
	
	// 조리지시 조회
	@Override
	public CookVO getcookOder(String co_code) {
			CookVO cvo = cdao.getcookOrder(co_code);
		return cvo;
	}
	
	//조리지시 실적등록
	@Override
	public void insertcookPerf(CookAddVO cavo) {
		cdao.insertcookPerf(cavo);
		cdao.addcpQTY(cavo);
		String co_status = cdao.getcookstatus(cavo.getCo_code());
		logger.debug("@@@@@@@@@@@@ co_status : "+co_status);
		if(co_status != null && !co_status.isEmpty()) { // 지시 상태면 
			if(co_status.equals("지시")) {
				cdao.updateStart(cavo.getCo_code()); // 시작으로 변경
			}
		}

		if(cdao.checkY(cavo.getCo_code())) { // 양품이 지시수량보다 같거나 많으면
			cdao.updateClose(cavo.getCo_code()); // 마감으로 지시 상태 변경
		}

	}
	
	// 조리실적등록 갯수
	@Override
	public Integer cooketccount(String co_code) {
		// TODO Auto-generated method stub
		return cdao.cooketccount(co_code);
	}
	
	//조리 실적 목록
	@Override
	public List<CookAddVO> cookEtcList(Map<String, Object> instrSearch,String co_code, PageVO pageVO) {
		// TODO Auto-generated method stub
		return cdao.cooketcList(instrSearch, pageVO, co_code);
	}
	
	// 조리실적 삭제
	@Override
	public void cooketcDelete(String cook_id) {
		
		CookAddVO cavo = cdao.getCooketc(cook_id);
		logger.debug("pvo : "+cavo);
		String co_code = cavo.getCo_code();
		String cerf_gobd = cavo.getCerf_gobd();
		logger.debug("cerf_gobd : "+cerf_gobd);
		// 불량이 아닐때만 생산수량에서 실적수량 감소
		if(cerf_gobd.equals("n")) {
			cdao.cfQTYDel(cavo);
			logger.debug("@@@@@@@@@@@@@@@@@@@@@@ cerf_gobd : "+cerf_gobd);
		}
		
		cdao.cooketcDel(cook_id);
		
		if(cdao.checkY(co_code)==false) { // 양품이 지시수량보다 적으면
			cdao.updateStart(co_code); // 시작상태로 변경
			if(cdao.getCrefCount(co_code)==0) { // 실적이 하나도 없으면
				cdao.updateInstr(co_code); // 지시상태로 변경
			}
		}
		
		
	}

	//조리실적 등록 - 생산수량 증가
	@Override
	public void addcpQTY(CookAddVO cavo) {
		cdao.addcpQTY(cavo);
	}

	// 조리실적 수동마감
	@Override
	public void costatusEnd(String co_code) {
		cdao.codatatusEnd(co_code);
	}


	//수주번호 체크
	@Override
	public Boolean checkrechod(String re_code) {
		return cdao.checkrecode(re_code);
	}

	
	//수주번호 중복체크
	@Override
	public Boolean checksuList(String re_code) {
		// TODO Auto-generated method stub
		return cdao.checksuList(re_code);
	}


	@Override
	public Boolean checksucookList(String re_code) {
		// TODO Auto-generated method stub
		return cdao.checksucookList(re_code);
	}
























	
	
	


} // public class end
