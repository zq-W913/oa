package com.offcn.pro.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.auth.bean.EmployeeBean;
import com.offcn.pro.bean.ProjectBean;
import com.offcn.pro.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/pro/")
public class ProjectController {
    @Autowired
    private ProjectService service;
    //获取所有项目信息
    @RequestMapping("showAll")
    public PageInfo<List<ProjectBean>> showAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                                @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize,
                                               @RequestParam(value ="make",defaultValue = "0",required = false) Integer make){
        PageHelper.startPage(pageNum,pageSize);
        List<ProjectBean> list = service.showAll(make);
        PageInfo info=new PageInfo(list);
        return info;
    }
    //根据id删除项目信息
    @RequestMapping("delById")
    public boolean delEmpById(String pids){
        return service.delEmpById(pids);
    }
    //添加项目信息
    @RequestMapping("addPro")
    public boolean addPro(ProjectBean project){
        return service.addPro(project);
    }
    //通过pid查询项目信息
    @RequestMapping("getProById")
    public ProjectBean getProById(Integer pid){
        return service.getProById(pid);
    }
    //修改信息
    @RequestMapping("connet")
    public boolean connet(ProjectBean project){
        return service.connet(project);
    }
}
