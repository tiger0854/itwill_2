package com.ddosirak.service;

import java.util.List;

import com.ddosirak.domain.ReceiveVO;

public interface ReceiveService {
	
	// 수주 등록
	public void receiveInsert(ReceiveVO vo) throws Exception;

	// 수주 목록
	public List<ReceiveVO> receiveList() throws Exception;
}
