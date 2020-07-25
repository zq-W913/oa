package com.offcn.msg.bean;

import com.offcn.auth.bean.EmployeeBean;

import java.io.Serializable;
import java.util.List;

public class EvaluateBean implements Serializable{

  private Integer evaid;
  private Integer forumFk;
  private Integer empFk4;
  private Integer evaidFk;
  private String evacontent;
  private String updatetime;
  private String evatime;
  private Integer evastatus;
  private List<EvaluateBean> huifuList;//评论的回复有evaid_fk
  private EmployeeBean emp;//评论人

  public List<EvaluateBean> getHuifuList() {
    return huifuList;
  }

  public void setHuifuList(List<EvaluateBean> huifuList) {
    this.huifuList = huifuList;
  }

  public EmployeeBean getEmp() {
    return emp;
  }

  public void setEmp(EmployeeBean emp) {
    this.emp = emp;
  }

  public Integer getEvaid() {
    return evaid;
  }

  public void setEvaid(Integer evaid) {
    this.evaid = evaid;
  }


  public Integer getForumFk() {
    return forumFk;
  }

  public void setForumFk(Integer forumFk) {
    this.forumFk = forumFk;
  }


  public Integer getEmpFk4() {
    return empFk4;
  }

  public void setEmpFk4(Integer empFk4) {
    this.empFk4 = empFk4;
  }


  public Integer getEvaidFk() {
    return evaidFk;
  }

  public void setEvaidFk(Integer evaidFk) {
    this.evaidFk = evaidFk;
  }


  public String getEvacontent() {
    return evacontent;
  }

  public void setEvacontent(String evacontent) {
    this.evacontent = evacontent;
  }


  public String getUpdatetime() {
    return updatetime;
  }

  public void setUpdatetime(String updatetime) {
    this.updatetime = updatetime;
  }


  public String getEvatime() {
    return evatime;
  }

  public void setEvatime(String evatime) {
    this.evatime = evatime;
  }


  public Integer getEvastatus() {
    return evastatus;
  }

  public void setEvastatus(Integer evastatus) {
    this.evastatus = evastatus;
  }

}
