package com.ddosirak.domain;

public class LineVO {

//    line_code VARCHAR(30) NOT NULL PRIMARY KEY,
//    line_name VARCHAR(45),
//    factory_code VARCHAR(45),
//    remark VARCHAR(45)	
	
	private String line_code;
	private String line_name;
	private String factory_code;
	private String remark;
	public String getLine_code() {
		return line_code;
	}
	public void setLine_code(String line_code) {
		this.line_code = line_code;
	}
	public String getLine_name() {
		return line_name;
	}
	public void setLine_name(String line_name) {
		this.line_name = line_name;
	}
	public String getFactory_code() {
		return factory_code;
	}
	public void setFactory_code(String factory_code) {
		this.factory_code = factory_code;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Override
	public String toString() {
		return "LineVO [line_code=" + line_code + ", line_name=" + line_name + ", factory_code=" + factory_code
				+ ", remark=" + remark + "]";
	}
	
	
}