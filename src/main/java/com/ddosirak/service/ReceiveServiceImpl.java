package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<ReceiveVO> receiveList() throws Exception {	
		return rdao.receiveList();
	}
	
	
	
	
	
	
	
	

}
