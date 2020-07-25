package com.offcn.usual.service;

import com.offcn.usual.bean.TaskBean;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface TaskService {
    List<TaskBean> showAll();

    boolean delTaskById(String pids);

    boolean commit(TaskBean task, HttpSession session);

    List<TaskBean> getTaskById(HttpSession session);
}
