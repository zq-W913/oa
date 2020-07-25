package com.offcn.pro.bean;

import com.offcn.auth.bean.EmployeeBean;
import com.offcn.cus.bean.CustomerBean;

import java.io.Serializable;
public class ProjectBean implements Serializable{

  private Integer pid;
  private String pname;
  private Integer comname;
  private Integer empFk1;
  private Integer empcount;
  private String starttime;
  private String buildtime;
  private Integer cost;
  private String level;
  private String endtime;
  private String remark;
  private Integer empFk;
  private CustomerBean customer;
  private EmployeeBean employee;

  public CustomerBean getCustomer() {
    return customer;
  }

  public void setCustomer(CustomerBean customer) {
    this.customer = customer;
  }

  public EmployeeBean getEmployee() {
    return employee;
  }

  public void setEmployee(EmployeeBean employee) {
    this.employee = employee;
  }

  public Integer getPid() {
    return pid;
  }

  public void setPid(Integer pid) {
    this.pid = pid;
  }


  public String getPname() {
    return pname;
  }

  public void setPname(String pname) {
    this.pname = pname;
  }


  public Integer getComname() {
    return comname;
  }

  public void setComname(Integer comname) {
    this.comname = comname;
  }


  public Integer getEmpFk1() {
    return empFk1;
  }

  public void setEmpFk1(Integer empFk1) {
    this.empFk1 = empFk1;
  }


  public Integer getEmpcount() {
    return empcount;
  }

  public void setEmpcount(Integer empcount) {
    this.empcount = empcount;
  }


  public String getStarttime() {
    return starttime;
  }

  public void setStarttime(String starttime) {
    this.starttime = starttime;
  }


  public String getBuildtime() {
    return buildtime;
  }

  public void setBuildtime(String buildtime) {
    this.buildtime = buildtime;
  }


  public Integer getCost() {
    return cost;
  }

  public void setCost(Integer cost) {
    this.cost = cost;
  }


  public String getLevel() {
    return level;
  }

  public void setLevel(String level) {
    this.level = level;
  }


  public String getEndtime() {
    return endtime;
  }

  public void setEndtime(String endtime) {
    this.endtime = endtime;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public Integer getEmpFk() {
    return empFk;
  }

  public void setEmpFk(Integer empFk) {
    this.empFk = empFk;
  }

}
