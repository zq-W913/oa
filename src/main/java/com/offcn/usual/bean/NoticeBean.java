package com.offcn.usual.bean;

import java.io.Serializable;
public class NoticeBean implements Serializable{

  private Integer nid;
  private String ntitle;
  private String remark;
  private String ndate;
  private Integer empFk;


  public Integer getNid() {
    return nid;
  }

  public void setNid(Integer nid) {
    this.nid = nid;
  }


  public String getNtitle() {
    return ntitle;
  }

  public void setNtitle(String ntitle) {
    this.ntitle = ntitle;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public String getNdate() {
    return ndate;
  }

  public void setNdate(String ndate) {
    this.ndate = ndate;
  }


  public Integer getEmpFk() {
    return empFk;
  }

  public void setEmpFk(Integer empFk) {
    this.empFk = empFk;
  }

}
