package com.offcn.usual.dao;

import com.offcn.usual.bean.BaoxiaoBean;
import com.offcn.usual.bean.ExpendituretypeBean;

import java.util.List;

public interface BaoxiaoDao {
    List<BaoxiaoBean> showAll();

    BaoxiaoBean getBxById(String bxid);

    int commit(BaoxiaoBean bao);

    List<BaoxiaoBean> getBxByEid(Integer eid);

    List<ExpendituretypeBean> getAllBxModel();

    int updata(BaoxiaoBean bao);
}
