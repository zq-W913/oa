package com.offcn.usual.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.pro.bean.ProjectBean;
import com.offcn.pro.service.ProjectService;
import com.offcn.usual.bean.ArchivesBean;
import com.offcn.usual.service.ArchivesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/arc/")
public class ArchivesController {
    @Autowired
    private ArchivesService service;
    //获取所有档案信息
    @RequestMapping("showAll")
    public PageInfo<List<ArchivesBean>> showAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                                @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<ArchivesBean> list = service.showAll();
        PageInfo info=new PageInfo(list);
        return info;
    }
    //根据id删除档案信息
    @RequestMapping("delById")
    public boolean delArcById(String pids){
        return service.delArcById(pids);
    }
}
