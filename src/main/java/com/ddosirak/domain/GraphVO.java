package com.ddosirak.domain;

import java.sql.Date;

public class GraphVO {
	
	private String line;
	private int result;
	public String getLine() {
		return line;
	}
	public void setLine(String line) {
		this.line = line;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	
	
	@Override
	public String toString() {
		return "GraphVO [line=" + line + ", result=" + result + "]";
	}

	
	
	
}
