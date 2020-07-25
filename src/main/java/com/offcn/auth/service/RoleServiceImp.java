package com.offcn.auth.service;

import com.offcn.auth.bean.RoleBean;
import com.offcn.auth.dao.RoleDao;
import com.offcn.util.ParamUtilBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class RoleServiceImp implements RoleService {
    @Autowired
    private RoleDao dao;
    @Override
    public List<RoleBean> showAll() {
        return dao.showAll();
    }
    @Override
    public RoleBean getRoleByPk(Integer roleid) {
        return dao.getRoleByPk(roleid);
    }

    /**1. 修改角色表
     * 2. 删除角色之前的权限
     * 3. 重新添加权限
     * @param role
     * @param ss
     * @return
     */
    @Override
    public boolean updateRole(RoleBean role, Integer[] ss) {
        //修改角色表
        int r1= dao.updateRole(role);

        int r2= dao.delRoleSourceByRoleid(role.getRoleid());

        List<ParamUtilBean> list=new ArrayList<>();
        for(Integer sid:ss){
            ParamUtilBean p=new ParamUtilBean();

            p.setRoleid(role.getRoleid());
            p.setEid(sid);
            list.add(p);
        }

        int r3= dao.addRoleSource(list);

        return true;
    }
}
