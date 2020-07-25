package com.offcn.duibiao.dao;

import com.offcn.duibiao.bean.DatacollectBean;
import com.offcn.duibiao.bean.DatacollectBean;
import com.offcn.duibiao.bean.IndexvalueBean;

import java.util.List;

/*
 *DuibiaoDao
 *@author peizhu
 *@date 2020/4/29 14:49
 *@Version 1.0
 */
public interface DuibiaoDao {
    public List<IndexvalueBean> findAll();

    List<DatacollectBean> getDistinctCompany();

    DatacollectBean getCompanyByPK(Integer daid);

    int addIndex(IndexvalueBean in);

    List<DatacollectBean> getComByCname(String cname);

    int delDuiById(String[] pid);
}
