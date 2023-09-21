package com.dalsul.common.cs.service;

import java.util.List;


import com.dalsul.common.cs.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> noticeList(NoticeVO nvo);
	public int noticeListCnt(NoticeVO nvo);
	public int managerNoticeInsert(NoticeVO nvo);
	public NoticeVO noticeDetail(NoticeVO nvo);
	public NoticeVO managerNoticeUpdateForm(NoticeVO nvo);
	public int managerNoticeUpdate(NoticeVO nvo);
	public int managerNoticeDelete(NoticeVO nvo);

}
