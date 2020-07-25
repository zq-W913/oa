package com.offcn.auth.dao;

import com.offcn.auth.bean.PositionBean;

import java.util.List;

public interface PositionDao {
    PositionBean getPositionBeanById(int id);

    List<PositionBean> getAllPosition();
}
