package com.ddosirak.domain;

public class LoginVO {
	private String employee_id;
	private String employee_pw;
	private String employee_name;
	
	// getter / setter
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmployee_pw() {
		return employee_pw;
	}
	public void setEmployee_pw(String employee_pw) {
		this.employee_pw = employee_pw;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	// toString()
	@Override
	public String toString() {
		return "LoginVO [employee_id=" + employee_id + ", employee_pw=" + employee_pw + ", employee_name="
				+ employee_name + "]";
	}

}// public class end
