package com.offcn.msg.bean;

import com.offcn.auth.bean.EmployeeBean;

import java.io.Serializable;
public class MsgBean implements Serializable{

  private Integer msgid;
  private Integer sendp;
  private Integer recvp;
  private Integer mark;
  private String msgcontent;
  private String msgtime;
  private EmployeeBean employee;

  public EmployeeBean getEmployee() {
    return employee;
  }

  public void setEmployee(EmployeeBean employee) {
    this.employee = employee;
  }

  public Integer getMsgid() {
    return msgid;
  }

  public void setMsgid(Integer msgid) {
    this.msgid = msgid;
  }


  public Integer getSendp() {
    return sendp;
  }

  public void setSendp(Integer sendp) {
    this.sendp = sendp;
  }


  public Integer getRecvp() {
    return recvp;
  }

  public void setRecvp(Integer recvp) {
    this.recvp = recvp;
  }


  public Integer getMark() {
    return mark;
  }

  public void setMark(Integer mark) {
    this.mark = mark;
  }


  public String getMsgcontent() {
    return msgcontent;
  }

  public void setMsgcontent(String msgcontent) {
    this.msgcontent = msgcontent;
  }


  public String getMsgtime() {
    return msgtime;
  }

  public void setMsgtime(String msgtime) {
    this.msgtime = msgtime;
  }

}
