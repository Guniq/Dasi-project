package dasi.web.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	private int replyNo;
	private int communityNo;
	private String replyWriter;
	private String replyContents;
	private Date replyDate;
	
}
