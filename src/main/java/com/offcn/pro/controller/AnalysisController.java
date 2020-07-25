package com.offcn.pro.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.pro.bean.AnalysisBean;
import com.offcn.pro.service.AnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/any/")
public class AnalysisController {
    @Autowired
    private AnalysisService service;
    //获取所有需求分析信息
    @RequestMapping("showAll")
    public PageInfo<List<AnalysisBean>> showAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                                @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<AnalysisBean> list = service.showAll();
        PageInfo info=new PageInfo(list);
        return info;
    }
    //根据id删除需求分析信息
    @RequestMapping("delById")
    public boolean delAnyById(String pids){
        return service.delAnyById(pids);
    }
    //添加需求分析
    @RequestMapping("commit")
    public boolean commit(AnalysisBean analysis){
        return service.commit(analysis);
    }
    //通过id查询需求分析
    @RequestMapping("getAnyByPK")
    public AnalysisBean getAnyByPK(Integer id){
        return service.getAnyByPK(id);
    }
    //修改需求分析
    @RequestMapping("updata")
    public boolean updata(AnalysisBean analysis){
        return service.updata(analysis);
    }
}
