package com.offcn.usual.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.usual.bean.BaoxiaoBean;
import com.offcn.usual.bean.ExpendituretypeBean;
import com.offcn.usual.bean.TaskBean;
import com.offcn.usual.service.BaoXiaoService;
import com.offcn.usual.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/bao/")
public class BaoXiaoController {
    @Autowired
    private BaoXiaoService service;
    //获取所有报销信息
    @RequestMapping("showAll")
    public PageInfo<List<BaoxiaoBean>> showAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                               @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<BaoxiaoBean> list = service.showAll();
        PageInfo info=new PageInfo(list);
        return info;
    }
    //通过主键查询报销信息
    @RequestMapping("getBxById")
    public BaoxiaoBean getBxById(String bxid){
        return service.getBxById(bxid);
    }
    //审批
    @RequestMapping("commit")
    public boolean commit(BaoxiaoBean bao){
        return service.commit(bao);
    }
    //通过外键查询报销信息
    @RequestMapping("getBxByEid")
    public PageInfo<List<BaoxiaoBean>> getBxByEid(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                               @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize,
                                                  HttpSession session){
        PageHelper.startPage(pageNum,pageSize);
        List<BaoxiaoBean> list = service.getBxByEid(session);
        PageInfo info=new PageInfo(list);
        return info;
    }
    //获取所有的报销类型
    @RequestMapping("getAllBxModel")
    public List<ExpendituretypeBean> getAllBxModel(){
        return service.getAllBxModel();
    }
    //修改报销审批信息
    @RequestMapping("updata")
    public boolean updata(BaoxiaoBean bao){
        return service.updata(bao);
    }
}
