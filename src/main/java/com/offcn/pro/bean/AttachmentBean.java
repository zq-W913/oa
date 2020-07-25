package com.offcn.pro.bean;

import java.io.Serializable;
public class AttachmentBean implements Serializable{

  private Integer id;
  private Integer proFk;
  private String attname;
  private String attdis;
  private String remark;
  private String path;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public Integer getProFk() {
    return proFk;
  }

  public void setProFk(Integer proFk) {
    this.proFk = proFk;
  }


  public String getAttname() {
    return attname;
  }

  public void setAttname(String attname) {
    this.attname = attname;
  }


  public String getAttdis() {
    return attdis;
  }

  public void setAttdis(String attdis) {
    this.attdis = attdis;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public String getPath() {
    return path;
  }

  public void setPath(String path) {
    this.path = path;
  }

}
