package com.offcn.auth.bean;

import java.io.Serializable;
public class RoleSourcesBean implements Serializable{

  private Integer rsid;
  private String rsdis;
  private Integer sid;
  private Integer roleid;


  public Integer getRsid() {
    return rsid;
  }

  public void setRsid(Integer rsid) {
    this.rsid = rsid;
  }


  public String getRsdis() {
    return rsdis;
  }

  public void setRsdis(String rsdis) {
    this.rsdis = rsdis;
  }


  public Integer getSid() {
    return sid;
  }

  public void setSid(Integer sid) {
    this.sid = sid;
  }


  public Integer getRoleid() {
    return roleid;
  }

  public void setRoleid(Integer roleid) {
    this.roleid = roleid;
  }

}
