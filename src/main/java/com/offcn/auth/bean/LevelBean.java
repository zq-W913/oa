package com.offcn.auth.bean;

import java.io.Serializable;
public class LevelBean implements Serializable{

  private Integer jid;
  private String jname;
  private String jdis;


  public Integer getJid() {
    return jid;
  }

  public void setJid(Integer jid) {
    this.jid = jid;
  }


  public String getJname() {
    return jname;
  }

  public void setJname(String jname) {
    this.jname = jname;
  }


  public String getJdis() {
    return jdis;
  }

  public void setJdis(String jdis) {
    this.jdis = jdis;
  }

}
