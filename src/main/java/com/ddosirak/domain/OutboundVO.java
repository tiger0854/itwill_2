package com.ddosirak.domain;

import java.sql.Date;
import java.util.List;

public class OutboundVO {

	private int out_id; // 출고아이디
	private String out_num; // 출고번호 
	private String out_customerNm; // 거래처 
	private Integer out_empCd; // 사원코드
	private String out_empNm; // 사원명
	private String item_code; // 상품코드 
	private String item_name; // 상품명
	private String out_notes; // 적요
	private int out_Cqty; // 출고 완료 수량
	private int out_qty; // 출고 예정 수량
	private int price; // 가격
	private int out_state; // 출고상태 default 1 (진행중)
	private String due_date; // 납기일자
	private Date out_date; // 출고일자
	private Date create_date; // 작성일자
	private int outNumCount; // outNum 카운트
	private String re_code; // 수주 번호
	private ProOrderVO proOrderVO; // proOrderVO와 join을 위해
	
	
	public int getOut_id() {
		return out_id;
	}
	public String getOut_num() {
		return out_num;
	}
	public String getOut_customerNm() {
		return out_customerNm;
	}
	public int getOut_empCd() {
		return out_empCd;
	}
	public String getOut_empNm() {
		return out_empNm;
	}
	public String getItem_code() {
		return item_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public String getOut_notes() {
		return out_notes;
	}
	public int getOut_Cqty() {
		return out_Cqty;
	}
	public int getOut_qty() {
		return out_qty;
	}
	public int getPrice() {
		return price;
	}
	public int getOut_state() {
		return out_state;
	}
	public String getDue_date() {
		return due_date;
	}
	public Date getOut_date() {
		return out_date;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public int getOutNumCount() {
		return outNumCount;
	}
	public String getRe_code() {
		return re_code;
	}
	public ProOrderVO getProOrderVO() {
		return proOrderVO;
	}
	public void setOut_id(int out_id) {
		this.out_id = out_id;
	}
	public void setOut_num(String out_num) {
		this.out_num = out_num;
	}
	public void setOut_customerNm(String out_customerNm) {
		this.out_customerNm = out_customerNm;
	}
	public void setOut_empCd(int out_empCd) {
		this.out_empCd = out_empCd;
	}
	public void setOut_empNm(String out_empNm) {
		this.out_empNm = out_empNm;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public void setOut_notes(String out_notes) {
		this.out_notes = out_notes;
	}
	public void setOut_Cqty(int out_Cqty) {
		this.out_Cqty = out_Cqty;
	}
	public void setOut_qty(int out_qty) {
		this.out_qty = out_qty;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setOut_state(int out_state) {
		this.out_state = out_state;
	}
	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}
	public void setOut_date(Date out_date) {
		this.out_date = out_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public void setOutNumCount(int outNumCount) {
		this.outNumCount = outNumCount;
	}
	public void setRe_code(String re_code) {
		this.re_code = re_code;
	}
	public void setProOrderVO(ProOrderVO proOrderVO) {
		this.proOrderVO = proOrderVO;
	}
	
	
	@Override
	public String toString() {
		return "OutboundVO [out_id=" + out_id + ", out_num=" + out_num + ", out_customerNm=" + out_customerNm
				+ ", out_empCd=" + out_empCd + ", out_empNm=" + out_empNm + ", item_code=" + item_code + ", item_name="
				+ item_name + ", out_notes=" + out_notes + ", out_Cqty=" + out_Cqty + ", out_qty=" + out_qty
				+ ", price=" + price + ", out_state="
				+ out_state + ", due_date=" + due_date + ", out_date=" + out_date + ", create_date=" + create_date
				+ ", outNumCount=" + outNumCount + ", re_code=" + re_code + ", proOrderVO=" + proOrderVO + "]";
	}
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
}
