package com.group.notice.dao;

import java.util.ArrayList;

import com.group.notice.dto.NoticeDto;

public interface NoticeDao {
	public int noticeCount();
	public ArrayList<NoticeDto> noticeList(NoticeDto dto);
}
