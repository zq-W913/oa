package com.offcn.pro.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.pro.bean.AnalysisBean;
import com.offcn.pro.bean.ModuleBean;
import com.offcn.pro.service.AnalysisService;
import com.offcn.pro.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/mod/")
public class ModuleController {
    @Autowired
    private ModuleService service;
    //获取所有模块信息
    @RequestMapping("showAll")
    public PageInfo<List<ModuleBean>> showAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                              @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<ModuleBean> list = service.showAll();
        PageInfo info=new PageInfo(list);
        return info;
    }
    //根据id删除模块信息
    @RequestMapping("delById")
    public boolean delModById(String pids){
        return service.delMOdById(pids);
    }
    //添加模块信息
    @RequestMapping("commit")
    public boolean commit(ModuleBean module){
        return service.commit(module);
    }
    //根据id查询模块信息
    @RequestMapping("getModuleByPk")
    public ModuleBean getModuleByPk(Integer id){
        return service.getModuleByPk(id);
    }
    //修改模块信息
    @RequestMapping("update")
    public boolean update(ModuleBean module){
        return service.update(module);
    }
    //根据外键查询信息
    @RequestMapping("getModuleByid")
    public List<ModuleBean> getModuleByid(Integer id){
        return service.getModuleByid(id);
    }
}
