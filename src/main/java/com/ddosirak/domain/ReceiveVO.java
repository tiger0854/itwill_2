package com.ddosirak.domain;

import java.sql.Date;

public class ReceiveVO {
	
	private int rec_id; // 수주아이디(PK용)
	private String re_code; // 수주 코드 
	private String item_code; // 품목코드
	private String item_name; // 품목명
//	private String re_customerCd; // 거래처코드
	private String re_customerNm; // 거래처명
	private Date re_date; // 수주 날짜
	private int re_empCd; // 담당자코드
	private String re_empNm; // 담당자이름
	private int re_qty; // 수주 수량
	private int re_state; // 수주 상태 (출고 완료시 출고 완료 띄워주기.)
	
	
	public int getRec_id() {
		return rec_id;
	}
	public String getRe_code() {
		return re_code;
	}
	public String getItem_code() {
		return item_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public String getRe_customerNm() {
		return re_customerNm;
	}
	public Date getRe_date() {
		return re_date;
	}
	public int getRe_empCd() {
		return re_empCd;
	}
	public String getRe_empNm() {
		return re_empNm;
	}
	public int getRe_qty() {
		return re_qty;
	}
	public int getRe_state() {
		return re_state;
	}
	public void setRec_id(int rec_id) {
		this.rec_id = rec_id;
	}
	public void setRe_code(String re_code) {
		this.re_code = re_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public void setRe_customerNm(String re_customerNm) {
		this.re_customerNm = re_customerNm;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public void setRe_empCd(int re_empCd) {
		this.re_empCd = re_empCd;
	}
	public void setRe_empNm(String re_empNm) {
		this.re_empNm = re_empNm;
	}
	public void setRe_qty(int re_qty) {
		this.re_qty = re_qty;
	}
	public void setRe_state(int re_state) {
		this.re_state = re_state;
	}
	
	
	@Override
	public String toString() {
		return "ReceiveVO [rec_id=" + rec_id + ", re_code=" + re_code + ", item_code=" + item_code + ", item_name="
				+ item_name + ", re_customerNm=" + re_customerNm + ", re_date=" + re_date + ", re_empCd=" + re_empCd
				+ ", re_empNm=" + re_empNm + ", re_qty=" + re_qty + ", re_state=" + re_state + "]";
	}
	
	
	
	
	
	

	
	

}
