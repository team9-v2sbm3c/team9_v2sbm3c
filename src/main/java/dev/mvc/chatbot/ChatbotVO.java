package dev.mvc.chatbot;

/*
    chatbotID INT NOT NULL,
    guestno NUMERIC(10) NOT NULL,
    question VARCHAR(300) NOT NULL,
    answer VARCHAR(300) NOT NULL,
    talk VARCHAR(5000),
    cdate date,
*/
public class ChatbotVO {
  
  private String chatbotID;
  private int guestno;
  private String question;
  private String answer;
  private String talk;
  private String cdate;
  
  public String getChatbotID() {
    return chatbotID;
  }
  public void setChatbotID(String chatbotID) {
    this.chatbotID = chatbotID;
  }
  public int getGuestno() {
    return guestno;
  }
  public void setGuestno(int guestno) {
    this.guestno = guestno;
  }
  public String getQuestion() {
    return question;
  }
  public void setQuestion(String question) {
    this.question = question;
  }
  public String getAnswer() {
    return answer;
  }
  public void setAnswer(String answer) {
    this.answer = answer;
  }
  public String getTalk() {
    return talk;
  }
  public void setTalk(String talk) {
    this.talk = talk;
  }
  public String getCdate() {
    return cdate;
  }
  public void setCdate(String cdate) {
    this.cdate = cdate;
  }
  


  
}
