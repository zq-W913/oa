package com.offcn.auth.bean;

import java.io.Serializable;
import java.util.List;

public class EmployeeBean implements Serializable{

  private Integer eid;
  private String ename;
  private String esex;
  private Integer eage;
  private String telephone;
  private String hiredate;
  private String pnum;
  private String username;
  private String password;
  private String remark;
  private Integer pFk;
  private Integer dFk;
  private Integer lFk;
  private String emppic;
  private PositionBean position;
  private List<EmpRoleBean> empRoleList;//根据员工主键获取员工的角色，主要想要员工的角色roleid
  private Integer role;

  public Integer getRole() {
    return role;
  }

  public void setRole(Integer role) {
    this.role = role;
  }

  public List<EmpRoleBean> getEmpRoleList() {
    return empRoleList;
  }

  public void setEmpRoleList(List<EmpRoleBean> empRoleList) {
    this.empRoleList = empRoleList;
  }

  public Integer getpFk() {
    return pFk;
  }

  public void setpFk(Integer pFk) {
    this.pFk = pFk;
  }


  public Integer getdFk() {
    return dFk;
  }

  public void setdFk(Integer dFk) {
    this.dFk = dFk;
  }

  public Integer getlFk() {
    return lFk;
  }

  public void setlFk(Integer lFk) {
    this.lFk = lFk;
  }

  public PositionBean getPosition() {
    return position;
  }

  public void setPosition(PositionBean position) {
    this.position = position;
  }

  public Integer getEid() {
    return eid;
  }

  public void setEid(Integer eid) {
    this.eid = eid;
  }


  public String getEname() {
    return ename;
  }

  public void setEname(String ename) {
    this.ename = ename;
  }


  public String getEsex() {
    return esex;
  }

  public void setEsex(String esex) {
    this.esex = esex;
  }


  public Integer getEage() {
    return eage;
  }

  public void setEage(Integer eage) {
    this.eage = eage;
  }


  public String getTelephone() {
    return telephone;
  }

  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }


  public String getHiredate() {
    return hiredate;
  }

  public void setHiredate(String hiredate) {
    this.hiredate = hiredate;
  }


  public String getPnum() {
    return pnum;
  }

  public void setPnum(String pnum) {
    this.pnum = pnum;
  }


  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public Integer getPFk() {
    return pFk;
  }

  public void setPFk(Integer pFk) {
    this.pFk = pFk;
  }


  public Integer getDFk() {
    return dFk;
  }

  public void setDFk(Integer dFk) {
    this.dFk = dFk;
  }


  public Integer getLFk() {
    return lFk;
  }

  public void setLFk(Integer lFk) {
    this.lFk = lFk;
  }


  public String getEmppic() {
    return emppic;
  }

  public void setEmppic(String emppic) {
    this.emppic = emppic;
  }

}
