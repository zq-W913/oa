package com.offcn.usual.bean;

import java.io.Serializable;
public class ExpendituretypeBean implements Serializable{

  private Integer etid;
  private String etname;


  public Integer getEtid() {
    return etid;
  }

  public void setEtid(Integer etid) {
    this.etid = etid;
  }


  public String getEtname() {
    return etname;
  }

  public void setEtname(String etname) {
    this.etname = etname;
  }

}
