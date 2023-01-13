package dasi.web.mapper;

import java.util.ArrayList;

import dasi.web.domain.ReplyDTO;

public interface ReplyMapper {
	
	// 댓글쓰기
	public void replyInsert(ReplyDTO replyDTO);
	
	// 댓글 리스트
	public ArrayList<ReplyDTO> replySelect(int communityNo); 
	
	// 댓글 삭제하기
	public int replyDelete(int replyNo);
	
	// 댓글 전체 수
	public int replyCount(int communityNo);
}
