package com.dalsul.common.cs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.common.cs.dao.NoticeDAO;
import com.dalsul.common.cs.vo.NoticeVO;

import lombok.Setter;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Setter(onMethod_ = @Autowired)
	private NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo){
		List<NoticeVO> list = null;
		list = noticeDAO.noticeList(nvo);
		return list;
	}
	@Override
	public int managerNoticeInsert(NoticeVO nvo) {
		int result = 0;
		
		result = noticeDAO.managerNoticeInsert(nvo);
		
		return result;
		
	}
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO detail = noticeDAO.noticeDetail(nvo);
		
		if(detail != null) {
			detail.setNotice_subject(detail.getNotice_subject().toString().replaceAll("\n", "<br/>"));
		}
		return detail;
	}
	@Override
	public NoticeVO managerNoticeUpdateForm(NoticeVO nvo) {
		NoticeVO updateData = null;
		updateData = noticeDAO.noticeDetail(nvo);
		return updateData;
	}
	@Override
	public int managerNoticeUpdate(NoticeVO nvo) {
		int result = 0;
		result = noticeDAO.managerNoticeUpdate(nvo);
		return result;
	}
	@Override
	public int managerNoticeDelete(NoticeVO nvo) {
		int result = 0;
		result = noticeDAO.managerNoticeDelete(nvo);
		return result;
	}
	@Override
	public int noticeListCnt(NoticeVO nvo) {
		int result = 0;
		result = noticeDAO.noticeListCnt(nvo);
		return result;
	}
	

}
