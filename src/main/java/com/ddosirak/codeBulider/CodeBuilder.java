package com.ddosirak.codeBulider;

public class CodeBuilder {

	private static int factoryCounter = 1;
	private static int itemDetailCounter = 1;
	private static int materialDetailCounter = 1;
	private static int warehouseCounter = 1;

	public enum ServiceName {
		FACTORY, ITEMDETAIL, MATERIALDETAIL, WAREHOUSE
	}

	public String FoundationCodeBuilder(ServiceName ServiceName) {
		String code="";
		StringBuilder sb = new StringBuilder();

		switch (ServiceName) {
		case FACTORY:
			sb.append("FAC");
			sb.append(String.format("%03d",factoryCounter));
			code=sb.toString();
			factoryCounter++;
			break;
		case ITEMDETAIL:
			sb.append("I");
			sb.append(String.format("%03d",itemDetailCounter));
			code=sb.toString();
			itemDetailCounter++;
			break;
		case MATERIALDETAIL:
			sb.append("M");
			sb.append(String.format("%04d",materialDetailCounter));
			code=sb.toString();
			materialDetailCounter++;
			break;
		case WAREHOUSE:	
			sb.append("WARE");
			sb.append(String.format("%03d",warehouseCounter));
			code=sb.toString();
			warehouseCounter++;
			break;
		}

		return code;
	}
}
