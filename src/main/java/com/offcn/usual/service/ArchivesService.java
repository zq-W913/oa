package com.offcn.usual.service;

import com.offcn.usual.bean.ArchivesBean;

import java.util.List;
public interface ArchivesService {
    List<ArchivesBean> showAll();

    boolean delArcById(String pids);
}
