package com.ddosirak.domain;

import java.util.List;

public class EmployeeListVO {
	
	private List<EmployeeVO> employeelist;
	
	// getter / setter
	public List<EmployeeVO> getEmployeelist() {
		return employeelist;
	}
	public void setEmployeelist(List<EmployeeVO> employeelist) {
		this.employeelist = employeelist;
	}

	//toString()
	@Override
	public String toString() {
		return "EmployeeListVO [employeelist=" + employeelist + "]";
	}
}// public class end
