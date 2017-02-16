package com.group.util.paging;

public class PagiNation {
	
	
	public PageDto paging(PageDto dto, int listCount){
		
		int nowPage = 1;
		int limit = 10;
		
		if (dto.getNowPage() != ""){
			nowPage = Integer.parseInt(dto.getNowPage());
		}
		
		int startRow = (nowPage - 1) * limit + 1;
		int endRow = startRow + limit -1;
		
		// 총 페이지 수
		int maxPage = (int)((double) listCount / limit + 0.95); //0.095를 더해서 올림처리    // 1.15
		// 현재 페이지에 보여줄 시작 페이지 수 ( 1, 11, 21 등 ... )
		int startPage = ((nowPage - 1) / 10) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수( 10, 20, 30 등... )
		int endPage = startPage + 10 - 1;
		if (endPage > maxPage){
			endPage = maxPage;
		}
		System.out.println("현재 페이지 : " + nowPage);
		System.out.println("한 블럭 페이지 : " + limit);
		System.out.println("맥스 페이지 : " + maxPage);
		System.out.println("시작 페이지 : " + startPage);
		System.out.println("마지막 페이지 : "+ endPage);
		System.out.println("======================");
		
		dto.setNowPage(Integer.toString(nowPage));
		dto.setLimit(limit);
		dto.setStartRow(startRow);
		dto.setEndRow(endRow);
		dto.setMaxPage(maxPage);
		dto.setStartPage(startPage);
		dto.setEndpage(endPage);
		dto.setListCount(listCount);
		
		return dto;
	}
}
