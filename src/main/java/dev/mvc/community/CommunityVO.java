package dev.mvc.community;

import org.springframework.web.multipart.MultipartFile;

/*
 * communityID                   		NUMBER(10)		 NOT NULL,
		activecodeno                  		NUMBER(10)		 NULL ,
		guestno                       		NUMBER(10)		 NOT NULL,
		planID                        		NUMBER(10)		 NULL ,
		title                         		VARCHAR2(200)		 NULL ,
		content                       		CLOB		 NULL ,
		mainImage                     		VARCHAR2(100)		 NULL ,
		mainImagePreview              		VARCHAR2(500)		 NULL ,
		cimage                        		VARCHAR2(200)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		map                           		VARCHAR2(500)		 NULL ,
		youtube                       		VARCHAR2(500)		 NULL ,
		cdate                         		DATE		 NULL ,
		replycnt                      		NUMBER(7)		 NULL 
 */
public class CommunityVO {
	private int communityID;
    private int activecodeno; // nullable
    private int guestno;
    private int planID; // nullable
    private String title;
    private String content;
    private String map;
    private String youtube;
    private String cdate; // String으로 변경
    private int replycnt;
    
    /** 이미지 관련 파일 **/
	private MultipartFile file1MF;
    private String size1_label = ""; //메인 이미지 크기 단위, 파일 크기 
	private String mainImage; //메인 이미지
    private String mainImagePreview; //프리뷰 
    private String cimage; //저장된 이미지
    private long size1; //이미지 크기 
    
    /**페이징 관련**/
    private int start_num;    // 시작 rownum
    private int end_num;    // 종료 rownum
    private int now_page = 1; //현재 페이지
    
	public int getCommunityID() {
		return communityID;
	}
	public void setCommunityID(int communityID) {
		this.communityID = communityID;
	}
	public int getActivecodeno() {
		return activecodeno;
	}
	public void setActivecodeno(int activecodeno) {
		this.activecodeno = activecodeno;
	}
	public int getGuestno() {
		return guestno;
	}
	public void setGuestno(int guestno) {
		this.guestno = guestno;
	}
	public int getPlanID() {
		return planID;
	}
	public void setPlanID(int planID) {
		this.planID = planID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMainImage() {
		return mainImage;
	}
	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}
	public String getMainImagePreview() {
		return mainImagePreview;
	}
	public void setMainImagePreview(String mainImagePreview) {
		this.mainImagePreview = mainImagePreview;
	}
	public String getCimage() {
		return cimage;
	}
	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public long getSize1() {
		return size1;
	}
	public void setSize1(long size1) {
		this.size1 = size1;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public String getYoutube() {
		return youtube;
	}
	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public MultipartFile getFile1MF() {
	      return file1MF;
	}

	public void setFile1MF(MultipartFile file1mf) {
	      file1MF = file1mf;
	}
}
