package com.dalsul.common.cs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.cs.vo.NoticeVO;

@Mapper
public interface NoticeDAO {

	public List<NoticeVO> noticeList(NoticeVO nvo);
	public int managerNoticeInsert(NoticeVO nvo);
	public NoticeVO noticeDetail(NoticeVO nvo);
	public int managerNoticeUpdate(NoticeVO nvo);
	public int managerNoticeDelete(NoticeVO nvo);
	public int noticeListCnt(NoticeVO nvo);


}
