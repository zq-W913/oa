package com.offcn.usual.bean;

import com.offcn.auth.bean.EmployeeBean;

import java.io.Serializable;
public class TaskBean implements Serializable{

  private Integer id;
  private String starttime;
  private String endtime;
  private String level;
  private String remark;
  private Integer funFk;
  private Integer empFk2;
  private Integer empFk;
  private String tasktitle;
  private Integer status;
  private EmployeeBean employee;

  public EmployeeBean getEmployee() {
    return employee;
  }

  public void setEmployee(EmployeeBean employee) {
    this.employee = employee;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getStarttime() {
    return starttime;
  }

  public void setStarttime(String starttime) {
    this.starttime = starttime;
  }


  public String getEndtime() {
    return endtime;
  }

  public void setEndtime(String endtime) {
    this.endtime = endtime;
  }


  public String getLevel() {
    return level;
  }

  public void setLevel(String level) {
    this.level = level;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public Integer getFunFk() {
    return funFk;
  }

  public void setFunFk(Integer funFk) {
    this.funFk = funFk;
  }


  public Integer getEmpFk2() {
    return empFk2;
  }

  public void setEmpFk2(Integer empFk2) {
    this.empFk2 = empFk2;
  }


  public Integer getEmpFk() {
    return empFk;
  }

  public void setEmpFk(Integer empFk) {
    this.empFk = empFk;
  }


  public String getTasktitle() {
    return tasktitle;
  }

  public void setTasktitle(String tasktitle) {
    this.tasktitle = tasktitle;
  }


  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }

}
