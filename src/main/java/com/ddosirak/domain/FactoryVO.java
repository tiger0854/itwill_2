package com.ddosirak.domain;

public class FactoryVO {
	private String factory_code;
	private String factory_name;
	
	public String getFactory_code() {
		return factory_code;
	}

	public void setFactory_code(String factory_code) {
		this.factory_code = factory_code;
	}

	public String getFactory_name() {
		return factory_name;
	}

	public void setFactory_name(String factory_name) {
		this.factory_name = factory_name;
	}

	@Override
	public String toString() {
		return "FactoryVO [factory_code=" + factory_code + ", factory_name=" + factory_name + "]";
	}
	
	
}
