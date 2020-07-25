package com.offcn.msg.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.msg.bean.MsgBean;
import com.offcn.msg.service.MsgService;
import com.offcn.pro.bean.ProjectBean;
import com.offcn.pro.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/msg/")
public class MsgController {
    @Autowired
    private MsgService service;
    //获取所有消息信息
    @RequestMapping("showAll")
    public PageInfo<List<MsgBean>> showAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                           @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<MsgBean> list = service.showAll();
        PageInfo info=new PageInfo(list);
        return info;
    }
    //根据id删除项目信息
    @RequestMapping("delById")
    public boolean delMsgById(String pids){
        return service.delMsgById(pids);
    }
    //定时保存消息
    @RequestMapping("save")
    public boolean saveMsg(MsgBean msg, HttpSession session){

        return service.save(msg,session);
    }


}
