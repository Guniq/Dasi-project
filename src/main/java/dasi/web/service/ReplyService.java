package dasi.web.service;


import java.util.ArrayList;

import dasi.web.domain.ReplyDTO;


public interface ReplyService {
	
	// 댓글쓰기
	public void replyWrite(ReplyDTO replyDTO);
	
	// 댓글 리스트
	public ArrayList<ReplyDTO> replyList(int communityNo);
	
	// 댓글 삭제하기
	public int replyRemove(int replyNo);
	
	// 댓글 전체 수
	public int replyCount(int communityNo);
}
