package com.ddosirak.domain;

public class PageVO {
	private int pageSize;
	private String pageNum;
	private int currentPage;
	private int startRow;
	private int pageBlock;
	private int startPage;
	private int endPage;
	private int count;
	private int pageCount;
	private int endRow;
	private String kind;
	private String state;
	private String search;

	// Getter / Setter
	
	public String getSearch() {
		if(this.search==null) {
			this.search = "";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	// toString
	@Override
	public String toString() {
		return "PageVO [pageSize=" + pageSize + ", pageNum=" + pageNum + ", currentPage=" + currentPage + ", startRow="
				+ startRow + ", pageBlock=" + pageBlock + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", count=" + count + ", pageCount=" + pageCount + ", endRow=" + endRow + ", search=" + search + "]";
		
		
	}

}// public class end