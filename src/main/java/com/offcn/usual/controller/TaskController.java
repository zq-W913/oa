package com.offcn.usual.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.pro.bean.ProjectBean;
import com.offcn.pro.service.ProjectService;
import com.offcn.usual.bean.TaskBean;
import com.offcn.usual.service.TaskService;
import javafx.concurrent.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.nio.channels.Pipe;
import java.util.List;

@RestController
@RequestMapping("/task/")
public class TaskController {
    @Autowired
    private TaskService service;
    //获取所有任务信息
    @RequestMapping("showAll")
    public PageInfo<List<TaskBean>> showAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                            @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<TaskBean> list = service.showAll();
        PageInfo info=new PageInfo(list);
        return info;
    }
    //根据id删除任务信息
    @RequestMapping("delById")
    public boolean delTaskById(String pids){
        return service.delTaskById(pids);
    }
    //添加任务信息
    @RequestMapping("commit")
    public boolean commit(TaskBean task, HttpSession session){
        return service.commit(task,session);
    }
    //根据外键id获取任务信息
    @RequestMapping("getTaskById")
    public PageInfo<List<TaskBean>> getTaskById(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                            @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize,
                                                HttpSession session){
        PageHelper.startPage(pageNum,pageSize);
        List<TaskBean> list = service.getTaskById(session);
        PageInfo info=new PageInfo(list);
        return info;
    }
}
