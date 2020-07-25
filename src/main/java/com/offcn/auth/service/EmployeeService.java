package com.offcn.auth.service;

import com.offcn.auth.bean.EmployeeBean;
import com.offcn.auth.bean.PositionBean;
import com.offcn.auth.bean.RoleBean;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface EmployeeService {
    boolean login(EmployeeBean e, HttpSession session);

    EmployeeBean getEmpById(HttpSession session);

    List<EmployeeBean> showBean();

    boolean delEmpById(String eids);

    List<EmployeeBean> getEmpByPfk(String pFk);

    EmployeeBean getById(Integer eid);

    List<PositionBean> getAllPosition();

    Boolean updateEmp(EmployeeBean emp, Integer[] roles);
}
