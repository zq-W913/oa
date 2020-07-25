package com.offcn.msg.service;

import com.offcn.msg.bean.EvaluateBean;
import com.offcn.msg.bean.ForumpostBean;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ForumService {
    List<ForumpostBean> showAll();

    ForumpostBean getForumByPk(Integer fid);

    boolean savaEvaid(EvaluateBean ev, HttpSession session);
}
