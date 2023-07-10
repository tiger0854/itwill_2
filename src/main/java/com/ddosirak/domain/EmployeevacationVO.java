package com.ddosirak.domain;

import java.sql.Date;

public class EmployeevacationVO {
	private String vacation_management;
	private Date vacation_start;
	private Date vacation_finish;
	private int employee_id;
	private String employee_name;
	private String position;
	private String department_name;
	private String phone_num;
	private String vacation_reason;
	private String subsitute;
	private int vacation_date;
	private String approve;
	private String approve_emp;
	private Date approve_date;
	private Date prop_date;
	private Integer vacation_id;
	private int total_vacation;
	
	public String getVacation_management() {
		return vacation_management;
	}
	public void setVacation_management(String vacation_management) {
		this.vacation_management = vacation_management;
	}
	public Date getVacation_start() {
		return vacation_start;
	}
	public void setVacation_start(Date vacation_start) {
		this.vacation_start = vacation_start;
	}
	public Date getVacation_finish() {
		return vacation_finish;
	}
	public void setVacation_finish(Date vacation_finish) {
		this.vacation_finish = vacation_finish;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getVacation_reason() {
		return vacation_reason;
	}
	public void setVacation_reason(String vacation_reason) {
		this.vacation_reason = vacation_reason;
	}
	public String getSubsitute() {
		return subsitute;
	}
	public void setSubsitute(String subsitute) {
		this.subsitute = subsitute;
	}
	public int getVacation_date() {
		return vacation_date;
	}
	public void setVacation_date(int vacation_date) {
		this.vacation_date = vacation_date;
	}
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}
	public String getApprove_emp() {
		return approve_emp;
	}
	public void setApprove_emp(String approve_emp) {
		this.approve_emp = approve_emp;
	}
	public Date getApprove_date() {
		return approve_date;
	}
	public void setApprove_date(Date approve_date) {
		this.approve_date = approve_date;
	}
	public Date getProp_date() {
		return prop_date;
	}
	public void setProp_date(Date prop_date) {
		this.prop_date = prop_date;
	}
	public Integer getVacation_id() {
		return vacation_id;
	}
	public void setVacation_id(Integer vacation_id) {
		this.vacation_id = vacation_id;
	}
	public int getTotal_vacation() {
		return total_vacation;
	}
	public void setTotal_vacation(int total_vacation) {
		this.total_vacation = total_vacation;
	}
	
	@Override
	public String toString() {
		return "EmployeevacationVO [vacation_management=" + vacation_management + ", vacation_start=" + vacation_start
				+ ", vacation_finish=" + vacation_finish + ", employee_id=" + employee_id + ", employee_name="
				+ employee_name + ", position=" + position + ", department_name=" + department_name + ", phone_num="
				+ phone_num + ", vacation_reason=" + vacation_reason + ", subsitute=" + subsitute + ", vacation_date="
				+ vacation_date + ", approve=" + approve + ", approve_emp=" + approve_emp + ", approve_date="
				+ approve_date + ", prop_date=" + prop_date + ", vacation_id=" + vacation_id + ", total_vacation="
				+ total_vacation + "]";
	}
	
	
	
	
	

	

	
	
}
