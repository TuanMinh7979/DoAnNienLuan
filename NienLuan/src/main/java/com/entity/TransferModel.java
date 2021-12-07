package com.entity;

import java.util.List;

public class  TransferModel<T>{
	private int pageIdx;
	private int totalPage;
	private List<T> listResult;
	
	
	
	public int getPageIdx() {
		return pageIdx;
	}
	public void setPageIdx(int pageIdx) {
		this.pageIdx = pageIdx;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getListResult() {
		return listResult;
	}
	public void setListResult(List<T> listResult) {
		this.listResult = listResult;
	}




	
	

}
