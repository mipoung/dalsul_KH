package com.dalsul.common.cs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.common.cs.dao.ReplyDAO;
import com.dalsul.common.cs.vo.ReplyVO;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Setter(onMethod_ = @Autowired)
	private ReplyDAO replyDAO;
	
	// 글목록 구현
	@Override
	public List<ReplyVO> replyList(ReplyVO rvo){
		List<ReplyVO> list = null;
		list = replyDAO.replyList(rvo);
		return list;
		
	}
	
	// 글입력 구현
	@Override
	public int replyInsert(ReplyVO rvo) {
		int result = 0;
		result = replyDAO.replyInsert(rvo);
		return result;
	}
	
	//글수정 구현
	@Override
	public int replyUpdate(ReplyVO rvo) {
		int result = replyDAO.replyUpdate(rvo);
		return result;
	}
	
	//글삭제 구현
	@Override
	public int replyDelete(int r_num) {
		int result = 0;
		result = replyDAO.replyDelete(r_num);
		
		return result;
	}

}
