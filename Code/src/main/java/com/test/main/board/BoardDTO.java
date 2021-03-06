package com.test.main.board;

// 업무별로 DAO는 1개당, DTO는 1개 or 1개 이상
// 오라클 테이블 1개당 > DTO 클래스 1개 생성
public class BoardDTO {

	private String seq;
	private String id;
	private String subject;
	private String content;
	private String regdate;
	private int readcount;
	private String userip;
	
	private String name;		// 작성자 이름
	private double isnew;		// 새글 유무
	
	private int commentcount;	// 댓글 수
	
	private int thread; 		//계층형
	private int depth;

	
	public int getThread() {
		return thread;
	}
	public void setThread(int thread) {
		this.thread = thread;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getCommentcount() {
		return commentcount;
	}
	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}
	public double getIsnew() {
		return isnew;
	}
	public void setIsnew(double isnew) {
		this.isnew = isnew;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getUserip() {
		return userip;
	}
	public void setUserip(String userip) {
		this.userip = userip;
	}
	

}
