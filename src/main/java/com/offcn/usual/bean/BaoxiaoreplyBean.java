package com.offcn.usual.bean;

import java.io.Serializable;
public class BaoxiaoreplyBean implements Serializable{

  private Integer id;
  private String content;
  private String replytime;
  private String baoxiaoFk;

  public int getBxstatus() {
    return bxstatus;
  }

  public void setBxstatus(int bxstatus) {
    this.bxstatus = bxstatus;
  }

  private int bxstatus;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }


  public String getReplytime() {
    return replytime;
  }

  public void setReplytime(String replytime) {
    this.replytime = replytime;
  }


  public String getBaoxiaoFk() {
    return baoxiaoFk;
  }

  public void setBaoxiaoFk(String baoxiaoFk) {
    this.baoxiaoFk = baoxiaoFk;
  }

}
