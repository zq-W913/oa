package com.offcn.auth.service;

import com.offcn.auth.bean.RoleSourcesBean;
import com.offcn.auth.bean.SourcesBean;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface SourceService {
    List<SourcesBean> showAll();

    List<RoleSourcesBean> getSourceByRoleid(Integer roleid);

    SourcesBean getSourceByEid(HttpSession session);
}
