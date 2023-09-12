package com.dalsul.common.cs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dalsul.common.cs.vo.NoticeVO;

@Service
public interface NoticeService {

	public List<NoticeVO> noticeList(NoticeVO nvo);
	public int noticeListCnt(NoticeVO nvo);
	public int adminNoticeInsert(NoticeVO nvo);
	public NoticeVO noticeDetail(NoticeVO nvo);
	public NoticeVO adminNoticeUpdateForm(NoticeVO nvo);
	public int adminNoticeUpdate(NoticeVO nvo);
	public int adminNoticeDelete(NoticeVO nvo);

}