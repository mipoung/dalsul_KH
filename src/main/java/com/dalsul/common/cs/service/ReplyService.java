package com.dalsul.common.cs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dalsul.common.cs.vo.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> replyList(ReplyVO rvo);
	public int replyInsert(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
	public int replyDelete(int inquiry_no);

}
