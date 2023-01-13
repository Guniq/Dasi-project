package dasi.web.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TrashDTO {
	private int trashNo;
	private String trashCategory;
	private String trashImage;
	private String trashName;
	private int trashHit;
	private String trashContents;
	private Date trashDate;
}
