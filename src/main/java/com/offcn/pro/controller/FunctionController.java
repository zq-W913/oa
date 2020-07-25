package com.offcn.pro.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.pro.bean.FunctionBean;
import com.offcn.pro.bean.ProjectBean;
import com.offcn.pro.service.FunctionService;
import com.offcn.pro.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/fun/")
public class FunctionController {
    @Autowired
    private FunctionService service;
    //获取所有功能信息
    @RequestMapping("showAll")
    public PageInfo<List<FunctionBean>> showAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                                @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize,
                                                @RequestParam(value ="make",defaultValue = "0",required = false) Integer make){
        PageHelper.startPage(pageNum,pageSize);
        List<FunctionBean> list = service.showAll(make);
        PageInfo info=new PageInfo(list);
        return info;
    }
    //根据id删除功能信息
    @RequestMapping("delById")
    public boolean delFunById(String pids){
        return service.delFunById(pids);
    }
    //添加功能
    @RequestMapping("commit")
    public boolean commit(FunctionBean function){
        return service.commit(function);
    }
    //根据外键查询功能信息
    @RequestMapping("getFunByMid")
    public List<FunctionBean> getFunByMid(Integer id){
        return service.getFunByMid(id);
    }
}
