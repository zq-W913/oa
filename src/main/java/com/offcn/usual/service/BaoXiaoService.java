package com.offcn.usual.service;

import com.offcn.usual.bean.BaoxiaoBean;
import com.offcn.usual.bean.ExpendituretypeBean;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface BaoXiaoService {
    List<BaoxiaoBean> showAll();

    BaoxiaoBean getBxById(String bxid);

    boolean commit(BaoxiaoBean bao);

    List<BaoxiaoBean> getBxByEid(HttpSession session);

    List<ExpendituretypeBean> getAllBxModel();

    boolean updata(BaoxiaoBean bao);
}
