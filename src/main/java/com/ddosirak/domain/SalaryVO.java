package com.ddosirak.domain;

import java.sql.Date;

public class SalaryVO {
	
	private int sal_num;
	private int employee_id;
	private String salary;
	private String deduction; // 공제사항
	private String salary_reason;
	private String salary_rule;
	private Date sal_date;
	
	// getter / setter
	public int getSal_num() {
		return sal_num;
	}
	public void setSal_num(int sal_num) {
		this.sal_num = sal_num;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getDeduction() {
		return deduction;
	}
	public void setDeduction(String deduction) {
		this.deduction = deduction;
	}
	public String getSalary_reason() {
		return salary_reason;
	}
	public void setSalary_reason(String salary_reason) {
		this.salary_reason = salary_reason;
	}
	public String getSalary_rule() {
		return salary_rule;
	}
	public void setSalary_rule(String salary_rule) {
		this.salary_rule = salary_rule;
	}
	public Date getSal_date() {
		return sal_date;
	}
	public void setSal_date(Date sal_date) {
		this.sal_date = sal_date;
	}
	
	// toString()
	@Override
	public String toString() {
		return "SalaryVO [sal_num=" + sal_num + ", employee_id=" + employee_id + ", salary=" + salary + ", deduction="
				+ deduction + ", salary_reason=" + salary_reason + ", salary_rule=" + salary_rule + ", sal_date="
				+ sal_date + "]";
	}
	
	


}// public class end
