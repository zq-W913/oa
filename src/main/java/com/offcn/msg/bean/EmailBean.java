package com.offcn.msg.bean;

import java.io.Serializable;
public class EmailBean implements Serializable{

  private Integer id;
  private String title;
  private String sendtime;
  private Integer empFk;
  private Integer empFk2;
  private String emailcontent;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }


  public String getSendtime() {
    return sendtime;
  }

  public void setSendtime(String sendtime) {
    this.sendtime = sendtime;
  }


  public Integer getEmpFk() {
    return empFk;
  }

  public void setEmpFk(Integer empFk) {
    this.empFk = empFk;
  }


  public Integer getEmpFk2() {
    return empFk2;
  }

  public void setEmpFk2(Integer empFk2) {
    this.empFk2 = empFk2;
  }


  public String getEmailcontent() {
    return emailcontent;
  }

  public void setEmailcontent(String emailcontent) {
    this.emailcontent = emailcontent;
  }

}
