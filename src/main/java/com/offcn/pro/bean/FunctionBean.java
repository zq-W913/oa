package com.offcn.pro.bean;

import java.io.Serializable;
public class FunctionBean implements Serializable{

  private Integer id;
  private String proname;
  private String analysisname;
  private Integer modeleFk;
  private String functionname;
  private String level;
  private String simpledis;
  private String detaileddis;
  private String remark;
  private ModuleBean module;

  public ModuleBean getModule() {
    return module;
  }

  public void setModule(ModuleBean module) {
    this.module = module;
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


  public String getAnalysisname() {
    return analysisname;
  }

  public void setAnalysisname(String analysisname) {
    this.analysisname = analysisname;
  }


  public Integer getModeleFk() {
    return modeleFk;
  }

  public void setModeleFk(Integer modeleFk) {
    this.modeleFk = modeleFk;
  }


  public String getFunctionname() {
    return functionname;
  }

  public void setFunctionname(String functionname) {
    this.functionname = functionname;
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
