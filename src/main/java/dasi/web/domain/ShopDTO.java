package dasi.web.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ShopDTO {
	private int shopNo;
	private String shopName;
	private String shopLink;
	private String shopImage;
	private Date shopDate;
}
