package com.offcn.pro.dao;

import com.offcn.pro.bean.AnalysisBean;

import java.util.List;

public interface AnalysisDao {
    int delanyById(String pids);

    List<AnalysisBean> showAll();

    int commit(AnalysisBean analysis);

    AnalysisBean getAnyByPK(Integer id);

    int updata(AnalysisBean analysis);
}
