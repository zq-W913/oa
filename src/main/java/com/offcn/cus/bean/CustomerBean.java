package com.offcn.cus.bean;

import java.io.Serializable;
import java.util.Date;

public class CustomerBean implements Serializable{

  private Integer id;
  private String comname;
  private String companyperson;
  private String comaddress;
  private String comphone;
  private String camera;
  private String present;
  private String remark;
  private String addtime;
  private Date createtime;

  public Date getCreatetime() {
    return createtime;
  }

  public void setCreatetime(Date createtime) {
    this.createtime = createtime;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getComname() {
    return comname;
  }

  public void setComname(String comname) {
    this.comname = comname;
  }


  public String getCompanyperson() {
    return companyperson;
  }

  public void setCompanyperson(String companyperson) {
    this.companyperson = companyperson;
  }


  public String getComaddress() {
    return comaddress;
  }

  public void setComaddress(String comaddress) {
    this.comaddress = comaddress;
  }


  public String getComphone() {
    return comphone;
  }

  public void setComphone(String comphone) {
    this.comphone = comphone;
  }


  public String getCamera() {
    return camera;
  }

  public void setCamera(String camera) {
    this.camera = camera;
  }


  public String getPresent() {
    return present;
  }

  public void setPresent(String present) {
    this.present = present;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public String getAddtime() {
    return addtime;
  }

  public void setAddtime(String addtime) {
    this.addtime = addtime;
  }

}
