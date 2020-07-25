package com.offcn.msg.controller;

import com.offcn.msg.bean.EvaluateBean;
import com.offcn.msg.bean.ForumpostBean;
import com.offcn.msg.service.ForumService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/*
 *ForumController
 *@author peizhu
 *@date 2020/4/27 10:00
 *@Version 1.0
 */
@RestController
@RequestMapping("/forum/")
public class ForumController {

    @Resource
    private ForumService service;

    @RequestMapping("showAll")
    public List<ForumpostBean> showAll() {

        return service.showAll();
    }

    @RequestMapping("getForumByPk")
    public ForumpostBean getForumByPk(Integer fid) {
        return service.getForumByPk(fid);
    }

    @RequestMapping("savaEvaid")
    public boolean addEvaid(EvaluateBean ev, HttpSession session) {
        return service.savaEvaid(ev, session);
    }
}
