package dasi.web.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dasi.web.domain.ReplyDTO;
import dasi.web.mapper.ReplyMapper;


@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper replyMapper;
	
	
	// 댓글 쓰기
	@Override
	public void replyWrite(ReplyDTO replyDTO) {
		
		replyMapper.replyInsert(replyDTO);
	}
	
	// 댓글 리스트
	@Override
	public ArrayList<ReplyDTO> replyList(int communityNo) {
		
		return replyMapper.replySelect(communityNo);
	}
	
	// 댓글 삭제
	@Override
	public int replyRemove(int replyNo) {
		
		return replyMapper.replyDelete(replyNo);
	}
	
	// 댓글 전체 수
	@Override
	public int replyCount(int communityNo) {
		return replyMapper.replyCount(communityNo);
	}
}
