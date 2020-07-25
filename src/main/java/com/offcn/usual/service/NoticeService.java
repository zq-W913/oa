package com.offcn.usual.service;

import com.offcn.usual.bean.NoticeBean;

import java.util.List;

public interface NoticeService {
    List<NoticeBean> showAll();

    boolean delNotById(String pids);

    boolean commit(NoticeBean notice);
}
