package com.yedam.board.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private long replyNo;
	private long brdNo;
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
}
