package com.offcn.pro.dao;

import com.offcn.pro.bean.FunctionBean;

import java.util.List;

public interface FunctionDao {
    List<FunctionBean> showAll();

    int delFunById(String[] pid);

    int commit(FunctionBean function);

    List<FunctionBean> getFunByMid(Integer id);
}
