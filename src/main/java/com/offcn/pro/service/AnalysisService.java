package com.offcn.pro.service;

import com.offcn.pro.bean.AnalysisBean;

import java.util.List;

public interface AnalysisService {
    List<AnalysisBean> showAll();

    boolean delAnyById(String pids);

    boolean commit(AnalysisBean analysis);

    AnalysisBean getAnyByPK(Integer id);

    boolean updata(AnalysisBean analysis);
}
