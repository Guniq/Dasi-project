package dasi.web.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberImage;
	private String memberName;
	private Date memberDate;
	
}
