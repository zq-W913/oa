package com.offcn.pro.service;

import com.offcn.pro.bean.FunctionBean;

import java.util.List;

public interface FunctionService {
    List<FunctionBean> showAll(Integer make);

    boolean delFunById(String pids);

    boolean commit(FunctionBean function);

    List<FunctionBean> getFunByMid(Integer id);
}
