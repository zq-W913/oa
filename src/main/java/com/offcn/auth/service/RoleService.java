package com.offcn.auth.service;

import com.offcn.auth.bean.RoleBean;

import java.util.List;

public interface RoleService {
    List<RoleBean> showAll();
    RoleBean getRoleByPk(Integer roleid);

    boolean updateRole(RoleBean role, Integer[] ss);
}
