package com.ddosirak.domain;

import java.sql.Date;
import java.util.List;

public class InboundVO {
		private int in_id;
	    private String in_number;
	    private String order_number;
	    private int in_piece;
	    private Date in_date;
	    private Date in_Edate;
	    private String in_resp;
	    private String wh_code;
	    private Date in_expir;
	    private int in_state;
	    private int in_Epiece;
	    private OrderVO orderVO;
	    
	    

		public OrderVO getOrderVO() {
			return orderVO;
		}
		public void setOrderVO(OrderVO orderVO) {
			this.orderVO = orderVO;
		}
		public int getIn_id() {
			return in_id;
		}
		public void setIn_id(int in_id) {
			this.in_id = in_id;
		}
		public String getIn_number() {
			return in_number;
		}
		public void setIn_number(String in_number) {
			this.in_number = in_number;
		}
		public String getOrder_number() {
			return order_number;
		}
		public void setOrder_number(String order_number) {
			this.order_number = order_number;
		}
		public int getIn_piece() {
			return in_piece;
		}
		public void setIn_piece(int in_piece) {
			this.in_piece = in_piece;
		}
		public Date getIn_date() {
			return in_date;
		}
		public void setIn_date(Date in_date) {
			this.in_date = in_date;
		}
		public Date getIn_Edate() {
			return in_Edate;
		}
		public void setIn_Edate(Date in_Edate) {
			this.in_Edate = in_Edate;
		}
		public String getIn_resp() {
			return in_resp;
		}
		public void setIn_resp(String in_resp) {
			this.in_resp = in_resp;
		}
		public String getWh_code() {
			return wh_code;
		}
		public void setWh_code(String wh_code) {
			this.wh_code = wh_code;
		}
		public Date getIn_expir() {
			return in_expir;
		}
		public void setIn_expir(Date in_expir) {
			this.in_expir = in_expir;
		}
		public int getIn_state() {
			return in_state;
		}
		public void setIn_state(int in_state) {
			this.in_state = in_state;
		}
		public int getIn_Epiece() {
			return in_Epiece;
		}
		public void setIn_Epiece(int in_Npiece) {
			this.in_Epiece = in_Npiece;
		}
		@Override
		public String toString() {
			return "InboundVO [in_id=" + in_id + ", in_number=" + in_number + ", order_number=" + order_number
					+ ", in_piece=" + in_piece + ", in_date=" + in_date + ", in_Edate=" + in_Edate + ", in_resp="
					+ in_resp + ", wh_code=" + wh_code + ", in_expir=" + in_expir + ", in_state=" + in_state
					+ ", in_Epiece=" + in_Epiece + "]";
		}
    
	    	
    
    
}
