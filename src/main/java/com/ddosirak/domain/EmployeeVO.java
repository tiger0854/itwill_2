package com.ddosirak.domain;

import java.sql.Date;
import java.sql.Timestamp;


public class EmployeeVO {
	private int employee_id;
	private String employee_name;
	private String jumin;
	private String department_name;
	private String position;
	private String phone_num;
	private String line_num;
	private String email;
	private String address;
	private String extraaddress;
	private String post_num;
	private String marriage;
	private Date emp_date;
	private String gender;
	private String employee_photo;
	private Date exp_date;
	private String employee_status;
	private String vacation_status;
	private String working_hours;
	
	// getter / setter
	
	public String getExtraaddress() {
		return extraaddress;
	}
	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
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
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getLine_num() {
		return line_num;
	}
	public void setLine_num(String line_num) {
		this.line_num = line_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPost_num() {
		return post_num;
	}
	public void setPost_num(String post_num) {
		this.post_num = post_num;
	}
	public String getMarriage() {
		return marriage;
	}
	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}
	public Date getEmp_date() {
		return emp_date;
	}
	public void setEmp_date(Date emp_date) {
		this.emp_date = emp_date;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmployee_photo() {
		return employee_photo;
	}
	public void setEmployee_photo(String employee_photo) {
		this.employee_photo = employee_photo;
	}
	public Date getExp_date() {
		return exp_date;
	}
	public void setExp_date(Date exp_date) {
		this.exp_date = exp_date;
	}
	public String getEmployee_status() {
		return employee_status;
	}
	public void setEmployee_status(String employee_status) {
		this.employee_status = employee_status;
	}
	public String getVacation_status() {
		return vacation_status;
	}
	public void setVacation_status(String vacation_status) {
		this.vacation_status = vacation_status;
	}
	public String getWorking_hours() {
		return working_hours;
	}
	public void setWorking_hours(String working_hours) {
		this.working_hours = working_hours;
	}
	
	//toString()
	@Override
	public String toString() {
		return "EmployeeVO [employee_id=" + employee_id + ", employee_name=" + employee_name + ", jumin=" + jumin
				+ ", department_name=" + department_name + ", position=" + position + ", phone_num=" + phone_num
				+ ", line_num=" + line_num + ", email=" + email + ", address=" + address + ", extraaddress="
				+ extraaddress + ", post_num=" + post_num + ", marriage=" + marriage + ", emp_date=" + emp_date
				+ ", gender=" + gender + ", employee_photo=" + employee_photo + ", exp_date=" + exp_date
				+ ", employee_status=" + employee_status + ", vacation_status=" + vacation_status + ", working_hours="
				+ working_hours + "]";
	}
	
	
	
}// public class end
