package com.dalsul.common.cs.service;

import java.util.List;


import com.dalsul.common.cs.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> noticeList(NoticeVO nvo);
	public int noticeListCnt(NoticeVO nvo);
	public int adminNoticeInsert(NoticeVO nvo);
	public NoticeVO noticeDetail(NoticeVO nvo);
	public NoticeVO adminNoticeUpdateForm(NoticeVO nvo);
	public int adminNoticeUpdate(NoticeVO nvo);
	public int adminNoticeDelete(NoticeVO nvo);

}
