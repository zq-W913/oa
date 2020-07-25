package com.offcn.auth.dao;

import com.offcn.auth.bean.RoleBean;
import com.offcn.util.ParamUtilBean;

import java.util.List;

public interface RoleDao {
    RoleBean getRoleByPk(Integer roleid);

    List<RoleBean> showAll();

    int updateRole(RoleBean role);

    int delRoleSourceByRoleid(Integer roleid);

    int addRoleSource(List<ParamUtilBean> list);


}
