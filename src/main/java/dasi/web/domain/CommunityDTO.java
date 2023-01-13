package dasi.web.domain;


import java.util.Date;

import lombok.Data;

@Data
public class CommunityDTO {
	private int communityNo;
	private String communityTitle;
	private String communityCategory;
	private String communityContents;
	private String communityImage;
	private String communityWriter;
	private String communityPw;
	private Date communityDate;
	
}
