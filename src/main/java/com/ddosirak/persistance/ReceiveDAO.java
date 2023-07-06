package com.ddosirak.persistance;

import java.util.List;

import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ReceiveVO;

public interface ReceiveDAO {
	
	// 수주 등록
	public void receiveInsert(ReceiveVO vo) throws Exception;

	// 수주 목록
	public List<ReceiveVO> receiveList(PageVO pageVO) throws Exception;
	
	// 수주 상세
	public ReceiveVO receiveDetail(String re_code) throws Exception;
	
	// 수주 수정
	public void receiveUpdate(ReceiveVO uvo) throws Exception;

	// 수주 삭제
	public Integer receiveRemove(String re_code) throws Exception;
	
	// 레시피요청(re_code가져오기)
	public String receiveRecodeGet() throws Exception;
	
	// 레시피요청(자재insert)
	public void receiveRequest(String re_code) throws Exception;
	
}
 
