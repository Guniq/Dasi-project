package dasi.web.domain;

import lombok.Data;

@Data
public class PageDTO {
	private int viewPage = 1;
	private int blockSize = 5;
	private int blockNum;
	private int blockStart;
	private int blockEnd;
	private int prevPage;
	private int nextPage;
	private int totalPage;
	
	private int startIndex;
	private int cntPerPage = 5;
	private int startRowNum;
	
	// 검색 기능
	private String searchType;
	private String keyWord;	
	
	
	public void setValue(int totalCnt, int cntPerPage) {
		
		this.totalPage = (int)Math.ceil((double)totalCnt/cntPerPage);
		
		this.startIndex = (viewPage-1)*cntPerPage;
		
		this.blockNum = (viewPage-1)/blockSize;
		
		this.blockStart = (blockSize*blockNum)+1;	
		
		this.blockEnd = blockStart + (blockSize - 1);
		
		if(blockEnd > totalPage) blockEnd = totalPage;
		
		this.prevPage = blockStart - 1;
		
		this.nextPage = blockEnd + 1;
		
		// 전체페이지 수를 초과할 수 없도록
		if(nextPage > totalPage) nextPage = totalPage;
		
		startRowNum = totalCnt - (viewPage-1)*cntPerPage;
	}
	
}
