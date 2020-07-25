package com.offcn.auth.dao;

import com.offcn.auth.bean.RoleSourcesBean;
import com.offcn.auth.bean.SourcesBean;

import java.util.List;

public interface SourceDao {
    List<SourcesBean> findAll();

    List<RoleSourcesBean> getSourceByRoleid(Integer roleid);

    List<SourcesBean> getSourceByEid(Integer eid);
}
