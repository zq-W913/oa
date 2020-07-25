package com.offcn.pro.service;

import com.offcn.auth.bean.EmployeeBean;
import com.offcn.pro.bean.ProjectBean;

import java.util.List;

public interface ProjectService {
    List<ProjectBean> showAll(Integer make);

    boolean delEmpById(String pids);

    boolean addPro(ProjectBean project);

    ProjectBean getProById(int pid);

    boolean connet(ProjectBean project);
}
