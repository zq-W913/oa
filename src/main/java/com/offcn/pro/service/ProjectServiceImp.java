package com.offcn.pro.service;

import com.offcn.pro.bean.ProjectBean;
import com.offcn.pro.dao.ProjectDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProjectServiceImp implements ProjectService{
    @Autowired
    private ProjectDao dao;
    @Override
    public List<ProjectBean> showAll(Integer make) {
        return dao.showAll(make);
    }

    @Override
    public boolean delEmpById(String pids) {
        String[] pid = pids.split(",");
        int row = dao.delEmpById(pid);
        if (row > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean addPro(ProjectBean project) {
        return dao.addPro(project)>0?true:false;
    }

    @Override
    public ProjectBean getProById(int pid) {
        return dao.getProById(pid);
    }

    @Override
    public boolean connet(ProjectBean project) {
        return dao.connet(project)>0?true:false;
    }
}
