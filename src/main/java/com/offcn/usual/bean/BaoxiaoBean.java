package com.offcn.usual.bean;

import com.offcn.auth.bean.EmployeeBean;

import java.io.Serializable;
import java.util.List;

public class BaoxiaoBean implements Serializable{

  private String bxid;
  private Integer paymode;
  private Double totalmoney;
  private String bxtime;
  private String bxremark;
  private Integer bxstatus;
  private Integer empFk;
  private String result;
  private EmployeeBean employee;
  private ExpendituretypeBean exp;
  private List<BaoxiaoreplyBean> replayList;

  public List<BaoxiaoreplyBean> getReplayList() {
    return replayList;
  }

  public void setReplayList(List<BaoxiaoreplyBean> replayList) {
    this.replayList = replayList;
  }

  public EmployeeBean getEmployee() {
    return employee;
  }

  public void setEmployee(EmployeeBean employee) {
    this.employee = employee;
  }

  public ExpendituretypeBean getExp() {
    return exp;
  }

  public void setExp(ExpendituretypeBean exp) {
    this.exp = exp;
  }

  public String getBxid() {
    return bxid;
  }

  public void setBxid(String bxid) {
    this.bxid = bxid;
  }


  public Integer getPaymode() {
    return paymode;
  }

  public void setPaymode(Integer paymode) {
    this.paymode = paymode;
  }


  public Double getTotalmoney() {
    return totalmoney;
  }

  public void setTotalmoney(Double totalmoney) {
    this.totalmoney = totalmoney;
  }


  public String getBxtime() {
    return bxtime;
  }

  public void setBxtime(String bxtime) {
    this.bxtime = bxtime;
  }


  public String getBxremark() {
    return bxremark;
  }

  public void setBxremark(String bxremark) {
    this.bxremark = bxremark;
  }


  public Integer getBxstatus() {
    return bxstatus;
  }

  public void setBxstatus(Integer bxstatus) {
    this.bxstatus = bxstatus;
  }


  public Integer getEmpFk() {
    return empFk;
  }

  public void setEmpFk(Integer empFk) {
    this.empFk = empFk;
  }


  public String getResult() {
    return result;
  }

  public void setResult(String result) {
    this.result = result;
  }

}
