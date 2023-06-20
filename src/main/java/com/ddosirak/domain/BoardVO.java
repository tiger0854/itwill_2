package com.ddosirak.domain;

import java.sql.Date;

public class BoardVO {

	private int emp_bno;
	private String employee_id;
	private String title;
	private String content;
	private int read_count;
	
	private String employee_name;
	private String position;
	private String department_name;
	
	private Date regdate;

	
	// getter / setter
	public int getEmp_bno() {
		return emp_bno;
	}

	public void setEmp_bno(int emp_bno) {
		this.emp_bno = emp_bno;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	// toString()
	@Override
	public String toString() {
		return "BoardVO [emp_bno=" + emp_bno + ", employee_id=" + employee_id + ", title=" + title + ", content="
				+ content + ", read_count=" + read_count + ", employee_name=" + employee_name + ", position=" + position
				+ ", department_name=" + department_name + ", regdate=" + regdate + "]";
	}

	
}// public class end
