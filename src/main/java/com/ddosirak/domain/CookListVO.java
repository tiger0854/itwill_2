package com.ddosirak.domain;

import java.util.List;

public class CookListVO {
	private List<CookVO> cookListvo;

	public List<CookVO> getCookListvo() {
		return cookListvo;
	}

	public void setCookListvo(List<CookVO> cookListvo) {
		this.cookListvo = cookListvo;
	}

	@Override
	public String toString() {
		return "CookListVO [cookListvo=" + cookListvo + "]";
	}
	
	
}
