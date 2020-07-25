package com.offcn.msg.service;

import com.offcn.msg.bean.MsgBean;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface MsgService {
    List<MsgBean> showAll();

    boolean delMsgById(String pids);

    boolean save(MsgBean msg, HttpSession session);
}
