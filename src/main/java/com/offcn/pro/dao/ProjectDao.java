package com.offcn.pro.dao;

import com.offcn.pro.bean.ProjectBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectDao {
    List<ProjectBean> showAll(@Param("make") Integer make);

    int delEmpById(String[] pid);

    int addPro(ProjectBean project);

    ProjectBean getProById(int pid);

    int connet(ProjectBean project);
}
