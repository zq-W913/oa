package com.offcn.duibiao.bean;

import com.offcn.auth.bean.EmployeeBean;

import java.io.Serializable;
public class IndexvalueBean implements Serializable{

  private Integer inId;
  private Double inTurnover;
  private String inBusiness;
  private Integer comnameFk;
  private String inRemark;
  private String inFile;
  private Integer empFk5;
  private String inStarttime;
  private String inEndtime;
  private String inUpdatetime;
  private DatacollectBean company;
  private EmployeeBean emp;

  public DatacollectBean getCompany() {
    return company;
  }

  public void setCompany(DatacollectBean company) {
    this.company = company;
  }

  public EmployeeBean getEmp() {
    return emp;
  }

  public void setEmp(EmployeeBean emp) {
    this.emp = emp;
  }

  public Integer getInId() {
    return inId;
  }

  public void setInId(Integer inId) {
    this.inId = inId;
  }


  public Double getInTurnover() {
    return inTurnover;
  }

  public void setInTurnover(Double inTurnover) {
    this.inTurnover = inTurnover;
  }


  public String getInBusiness() {
    return inBusiness;
  }

  public void setInBusiness(String inBusiness) {
    this.inBusiness = inBusiness;
  }


  public Integer getComnameFk() {
    return comnameFk;
  }

  public void setComnameFk(Integer comnameFk) {
    this.comnameFk = comnameFk;
  }


  public String getInRemark() {
    return inRemark;
  }

  public void setInRemark(String inRemark) {
    this.inRemark = inRemark;
  }


  public String getInFile() {
    return inFile;
  }

  public void setInFile(String inFile) {
    this.inFile = inFile;
  }


  public Integer getEmpFk5() {
    return empFk5;
  }

  public void setEmpFk5(Integer empFk5) {
    this.empFk5 = empFk5;
  }


  public String getInStarttime() {
    return inStarttime;
  }

  public void setInStarttime(String inStarttime) {
    this.inStarttime = inStarttime;
  }


  public String getInEndtime() {
    return inEndtime;
  }

  public void setInEndtime(String inEndtime) {
    this.inEndtime = inEndtime;
  }


  public String getInUpdatetime() {
    return inUpdatetime;
  }

  public void setInUpdatetime(String inUpdatetime) {
    this.inUpdatetime = inUpdatetime;
  }

}
