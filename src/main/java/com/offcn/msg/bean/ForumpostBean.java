package com.offcn.msg.bean;

import com.offcn.auth.bean.EmployeeBean;

import java.io.Serializable;
import java.util.List;

public class ForumpostBean implements Serializable{

  private Integer forumid;
  private String forumtitle;
  private String forumcontent;
  private Integer empFk3;
  private String createtime;
  private Integer status;
  private EmployeeBean emp;//发帖人

  private List<EvaluateBean> pinglunList;//评论没有evaid_fk

  public EmployeeBean getEmp() {
    return emp;
  }

  public void setEmp(EmployeeBean emp) {
    this.emp = emp;
  }

  public List<EvaluateBean> getPinglunList() {
    return pinglunList;
  }

  public void setPinglunList(List<EvaluateBean> pinglunList) {
    this.pinglunList = pinglunList;
  }

  public Integer getForumid() {
    return forumid;
  }

  public void setForumid(Integer forumid) {
    this.forumid = forumid;
  }


  public String getForumtitle() {
    return forumtitle;
  }

  public void setForumtitle(String forumtitle) {
    this.forumtitle = forumtitle;
  }


  public String getForumcontent() {
    return forumcontent;
  }

  public void setForumcontent(String forumcontent) {
    this.forumcontent = forumcontent;
  }


  public Integer getEmpFk3() {
    return empFk3;
  }

  public void setEmpFk3(Integer empFk3) {
    this.empFk3 = empFk3;
  }


  public String getCreatetime() {
    return createtime;
  }

  public void setCreatetime(String createtime) {
    this.createtime = createtime;
  }


  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }

}
