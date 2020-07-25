package com.offcn.msg.dao;

import com.offcn.msg.bean.MsgBean;

import java.util.List;

public interface MsgDao {
    List<MsgBean> showAll();

    int delMsgById(String[] pid);
}
