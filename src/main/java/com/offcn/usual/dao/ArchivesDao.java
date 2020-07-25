package com.offcn.usual.dao;

import com.offcn.usual.bean.ArchivesBean;

import java.util.List;

public interface ArchivesDao {
    List<ArchivesBean> showAll();

    int delArcById(String[] pid);
}
