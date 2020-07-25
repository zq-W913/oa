package com.offcn.msg.dao;

import com.offcn.msg.bean.EvaluateBean;
import com.offcn.msg.bean.ForumpostBean;

import java.util.List;

/*
 *ForumDao
 *@author peizhu
 *@date 2020/4/27 10:03
 *@Version 1.0
 */
public interface ForumDao {
    List<ForumpostBean> findAll();

    ForumpostBean getForumByPk(Integer fid);

    int savaEvaid(EvaluateBean ev);
}
