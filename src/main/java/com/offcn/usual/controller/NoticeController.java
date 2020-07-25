package com.offcn.usual.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.usual.bean.NoticeBean;
import com.offcn.usual.bean.TaskBean;
import com.offcn.usual.service.NoticeService;
import com.offcn.usual.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/not/")
public class NoticeController {
    @Autowired
    private NoticeService service;
    //获取通告信息
    @RequestMapping("showAll")
    public PageInfo<List<NoticeBean>> showAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                              @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<NoticeBean> list = service.showAll();
        PageInfo info=new PageInfo(list);
        return info;
    }
    //根据id删除通告信息
    @RequestMapping("delById")
    public boolean delNotById(String pids){
        return service.delNotById(pids);
    }
    //添加通告信息
    @RequestMapping("commit")
    public boolean commit(NoticeBean notice){
        return service.commit(notice);
    }
}
