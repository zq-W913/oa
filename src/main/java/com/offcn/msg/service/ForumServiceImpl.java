package com.offcn.msg.service;

import com.offcn.auth.bean.EmployeeBean;
import com.offcn.msg.bean.EvaluateBean;
import com.offcn.msg.bean.ForumpostBean;
import com.offcn.msg.dao.ForumDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/*
 *ForumServiceImpl
 *@author peizhu
 *@date 2020/4/27 10:02
 *@Version 1.0
 */
@Service
public class ForumServiceImpl implements ForumService {
    @Resource
    private ForumDao dao;

    @Override
    public List<ForumpostBean> showAll() {
        return dao.findAll();
    }

    @Override
    public ForumpostBean getForumByPk(Integer fid) {
        return dao.getForumByPk(fid);
    }

    @Override
    public boolean savaEvaid(EvaluateBean ev, HttpSession session) {
        EmployeeBean emp= (EmployeeBean) session.getAttribute("emp");
        ev.setEmpFk4(emp.getEid());
        int res=dao.savaEvaid(ev);
        return res>0?true:false;
    }
}
