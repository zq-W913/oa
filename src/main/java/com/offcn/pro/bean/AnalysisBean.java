package com.offcn.pro.bean;

import java.io.Serializable;
public class AnalysisBean implements Serializable{

  private Integer id;
  private String proname;
  private String title;
  private String simpledis;
  private String detaileddis;
  private String addtime;
  private String updatetime;
  private String remark;
  private ProjectBean project;

  public ProjectBean getProject() {
    return project;
  }

  public void setProject(ProjectBean project) {
    this.project = project;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getProname() {
    return proname;
  }

  public void setProname(String proname) {
    this.proname = proname;
  }


  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }


  public String getSimpledis() {
    return simpledis;
  }

  public void setSimpledis(String simpledis) {
    this.simpledis = simpledis;
  }


  public String getDetaileddis() {
    return detaileddis;
  }

  public void setDetaileddis(String detaileddis) {
    this.detaileddis = detaileddis;
  }


  public String getAddtime() {
    return addtime;
  }

  public void setAddtime(String addtime) {
    this.addtime = addtime;
  }


  public String getUpdatetime() {
    return updatetime;
  }

  public void setUpdatetime(String updatetime) {
    this.updatetime = updatetime;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

}
