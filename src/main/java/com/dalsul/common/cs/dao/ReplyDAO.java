package com.dalsul.common.cs.dao;

import java.util.List;

import com.dalsul.common.cs.vo.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> replyList(ReplyVO rvo);
	public int replyInsert(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
	public int replyDelete(int r_num);

}
