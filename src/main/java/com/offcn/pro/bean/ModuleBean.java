package com.offcn.pro.bean;

import java.io.Serializable;
public class ModuleBean implements Serializable{

  private Integer id;
  private String proname;
  private Integer analysisFk;
  private String modname;
  private String level;
  private String simpledis;
  private String detaileddis;
  private String remark;
  private ProjectBean project;
  private AnalysisBean analysis;

  public ProjectBean getProject() {
    return project;
  }

  public void setProject(ProjectBean project) {
    this.project = project;
  }

  public AnalysisBean getAnalysis() {
    return analysis;
  }

  public void setAnalysis(AnalysisBean analysis) {
    this.analysis = analysis;
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


  public Integer getAnalysisFk() {
    return analysisFk;
  }

  public void setAnalysisFk(Integer analysisFk) {
    this.analysisFk = analysisFk;
  }


  public String getModname() {
    return modname;
  }

  public void setModname(String modname) {
    this.modname = modname;
  }


  public String getLevel() {
    return level;
  }

  public void setLevel(String level) {
    this.level = level;
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


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

}
