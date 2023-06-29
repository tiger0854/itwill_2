package com.ddosirak.domain;

import java.sql.Timestamp;

public class EmployeeCheckVO {
	private int employee_id;
	private String emp_check;
	private String emp_in;
	private String emp_out;
	private Timestamp date_time;
	private String reason;
	
	// Getter / Setter
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmp_check() {
		return emp_check;
	}
	public void setEmp_check(String emp_check) {
		this.emp_check = emp_check;
	}
	public String getEmp_in() {
		return emp_in;
	}
	public void setEmp_in(String emp_in) {
		this.emp_in = emp_in;
	}
	public String getEmp_out() {
		return emp_out;
	}
	public void setEmp_out(String emp_out) {
		this.emp_out = emp_out;
	}
	public Timestamp getDate_time() {
		return date_time;
	}
	public void setDate_time(Timestamp date_time) {
		this.date_time = date_time;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	// toString() 
	@Override
	public String toString() {
		return "EmployeeCheckVO [employee_id=" + employee_id + ", emp_check=" + emp_check + ", emp_in=" + emp_in + ", emp_out="
				+ emp_out + ", date_time=" + date_time + ", reason=" + reason + "]";
	}
	
}// public class end
