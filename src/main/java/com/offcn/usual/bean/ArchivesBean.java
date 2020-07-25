package com.offcn.usual.bean;

import com.offcn.auth.bean.EmployeeBean;

import java.io.Serializable;
public class ArchivesBean implements Serializable{

  private String dnum;
  private String landline;
  private String school;
  private String zhuanye;
  private String sosperson;
  private String biyedate;
  private String zzmm;
  private String minzu;
  private String xueli;
  private String email;
  private Integer empFk;
  private String remark;
  private String hirdate;
  private EmployeeBean employee;

  public EmployeeBean getEmployee() {
    return employee;
  }

  public void setEmployee(EmployeeBean employee) {
    this.employee = employee;
  }

  public String getDnum() {
    return dnum;
  }

  public void setDnum(String dnum) {
    this.dnum = dnum;
  }


  public String getLandline() {
    return landline;
  }

  public void setLandline(String landline) {
    this.landline = landline;
  }


  public String getSchool() {
    return school;
  }

  public void setSchool(String school) {
    this.school = school;
  }


  public String getZhuanye() {
    return zhuanye;
  }

  public void setZhuanye(String zhuanye) {
    this.zhuanye = zhuanye;
  }


  public String getSosperson() {
    return sosperson;
  }

  public void setSosperson(String sosperson) {
    this.sosperson = sosperson;
  }


  public String getBiyedate() {
    return biyedate;
  }

  public void setBiyedate(String biyedate) {
    this.biyedate = biyedate;
  }


  public String getZzmm() {
    return zzmm;
  }

  public void setZzmm(String zzmm) {
    this.zzmm = zzmm;
  }


  public String getMinzu() {
    return minzu;
  }

  public void setMinzu(String minzu) {
    this.minzu = minzu;
  }


  public String getXueli() {
    return xueli;
  }

  public void setXueli(String xueli) {
    this.xueli = xueli;
  }


  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }


  public Integer getEmpFk() {
    return empFk;
  }

  public void setEmpFk(Integer empFk) {
    this.empFk = empFk;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public String getHirdate() {
    return hirdate;
  }

  public void setHirdate(String hirdate) {
    this.hirdate = hirdate;
  }

}
