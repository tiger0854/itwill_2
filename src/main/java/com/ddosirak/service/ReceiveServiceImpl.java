package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ReceiveVO;
import com.ddosirak.persistance.ReceiveDAO;

@Service
public class ReceiveServiceImpl implements ReceiveService {
	
	@Autowired
	private ReceiveDAO rdao;

	
	// 수주 등록
	@Override
	public void receiveInsert(ReceiveVO vo) throws Exception {
		rdao.receiveInsert(vo);
	}

	// 수주 목록
	@Override
	public List<ReceiveVO> receiveList(PageVO pageVO) throws Exception {	
		return rdao.receiveList(pageVO);
	}

	// 수주 상세
	@Override
	public ReceiveVO receiveDetail(String re_code) throws Exception {
		return rdao.receiveDetail(re_code);
	}

	// 수주 수정
	@Override
	public void receiveUpdate(ReceiveVO uvo) throws Exception {
		rdao.receiveUpdate(uvo);
	}

	// 수주 삭제
	@Override
	public Integer receiveRemove(String re_code) throws Exception {
		return rdao.receiveRemove(re_code);
	}

	// 레시피요청

	@Override
	public String receiveRecodeGet() throws Exception {
		return rdao.receiveRecodeGet();
	}
	
	@Override
	public void receiveRequest(String re_code) throws Exception {
	
		rdao.receiveRequest(re_code);
		
	}
	
	
	
	
	
	

}
