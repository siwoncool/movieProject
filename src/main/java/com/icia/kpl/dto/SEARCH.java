package com.icia.kpl.dto;

import lombok.Data;

@Data
public class SEARCH {
	private String category;
	private String keyword;
	private int page;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int startRow;
	private int endRow;
	private int limit;
	
}
