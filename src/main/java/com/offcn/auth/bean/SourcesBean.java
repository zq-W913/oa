package com.offcn.auth.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class SourcesBean implements Serializable{

  private Integer id;
  private String name;
  private String url;
  private String remark;
  private Integer pid;
  private String icon;
  private boolean open=true;
  private List<SourcesBean> children=new ArrayList<>();

  public boolean isOpen() {
    return open;
  }

  public void setOpen(boolean open) {
    this.open = open;
  }

  public List<SourcesBean> getChildren() {
    return children;
  }

  public void setChildren(List<SourcesBean> children) {
    this.children = children;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }


  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }


  public Integer getPid() {
    return pid;
  }

  public void setPid(Integer pid) {
    this.pid = pid;
  }


  public String getIcon() {
    return icon;
  }

  public void setIcon(String icon) {
    this.icon = icon;
  }

}
