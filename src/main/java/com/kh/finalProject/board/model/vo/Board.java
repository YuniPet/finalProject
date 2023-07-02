package com.kh.finalProject.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Board {
	private int bNo;  //게시글번호
	private String bWriter; // 회원id
	private String bTag; // 게시글 구분 
	private String bTitle;  //제목
	private String bContent; //내용
	private Date bCreate; /* 디폴트 */
	private int bCount;    /*디폴트 */
}
