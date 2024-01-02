package dev.mvc.comments;

public class CommentsGuestVO {
	/** 댓글 번호 */
	private int commentsID; // commentsID
	/** 관련 글 번호 */
	private int communityID; // communityID
	/** 회원 번호 */
	private int guestno; // guestno
	/** 사용자 명*/
	private String gname;
	/** 내용 */
	private String comments; // comments
	/** 등록일 */
	private String comments_date; // comments_date
	
	public int getCommentsID() {
		return commentsID;
	}
	public void setCommentsID(int commentsID) {
		this.commentsID = commentsID;
	}
	public int getCommunityID() {
		return communityID;
	}
	public void setCommunityID(int communityID) {
		this.communityID = communityID;
	}
	public int getGuestno() {
		return guestno;
	}
	public void setGuestno(int guestno) {
		this.guestno = guestno;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getComments_date() {
		return comments_date;
	}
	public void setComments_date(String comments_date) {
		this.comments_date = comments_date;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	
	
}
