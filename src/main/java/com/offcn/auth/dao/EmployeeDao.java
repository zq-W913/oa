package com.offcn.auth.dao;

import com.offcn.auth.bean.EmployeeBean;
import com.offcn.auth.bean.RoleBean;

import java.util.List;

public interface EmployeeDao {
    //登录验证的方法
    EmployeeBean findEmpByNameAndPsw(EmployeeBean e);
    //通过id获取员工信息
    EmployeeBean getEmpById(int eid);

    List<EmployeeBean> showAll();

    int delEmpById(String[] eid);

    List<EmployeeBean> getEmpByPfk(String pFk);

    List<RoleBean> getAllRole();

    int updateEmp(EmployeeBean emp);

    int delEmpRoleByEid(Integer eid);

    int addRole(List<EmployeeBean> es);
}
