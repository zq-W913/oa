package com.offcn.usual.dao;

import com.offcn.usual.bean.TaskBean;

import java.util.List;

public interface TaskDao {
    List<TaskBean> showAll();

    int delTaskById(String pids);

    int commit(TaskBean task);

    List<TaskBean> getTaskById(Integer eid);
}
