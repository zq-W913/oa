package com.offcn.usual.dao;

import com.offcn.usual.bean.NoticeBean;

import java.util.List;

public interface NoticeDao {
    List<NoticeBean> showAll();

    int delNotById(String pids);

    int commit(NoticeBean notice);
}
