package com.offcn.usual.dao;

import com.offcn.usual.bean.BaoxiaoBean;
import com.offcn.usual.bean.BaoxiaoreplyBean;
import com.offcn.usual.bean.ExpendituretypeBean;

import java.util.List;

public interface BaoRepDao {
    int addReplay(BaoxiaoBean bao);
    List<BaoxiaoreplyBean> getReplayByBxid(Integer id);
}
