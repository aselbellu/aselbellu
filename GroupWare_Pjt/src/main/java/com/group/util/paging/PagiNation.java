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
		
		// �� ������ ��
		int maxPage = (int)((double) listCount / limit + 0.95); //0.095�� ���ؼ� �ø�ó��    // 1.15
		// ���� �������� ������ ���� ������ �� ( 1, 11, 21 �� ... )
		int startPage = ((nowPage - 1) / 10) * 10 + 1;
		// ���� �������� ������ ������ ������ ��( 10, 20, 30 ��... )
		int endPage = startPage + 10 - 1;
		if (endPage > maxPage){
			endPage = maxPage;
		}
		System.out.println("���� ������ : " + nowPage);
		System.out.println("�� �� ������ : " + limit);
		System.out.println("�ƽ� ������ : " + maxPage);
		System.out.println("���� ������ : " + startPage);
		System.out.println("������ ������ : "+ endPage);
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
