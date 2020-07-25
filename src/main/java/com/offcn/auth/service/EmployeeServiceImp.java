package com.offcn.auth.service;

import com.offcn.auth.bean.EmployeeBean;
import com.offcn.auth.bean.PositionBean;
import com.offcn.auth.bean.RoleBean;
import com.offcn.auth.dao.EmployeeDao;
import com.offcn.auth.dao.PositionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeServiceImp implements EmployeeService {
    @Autowired
    private EmployeeDao dao;
    @Autowired
    private PositionDao pdao;
    @Override
    public boolean login(EmployeeBean e, HttpSession session) {
        EmployeeBean emp = dao.findEmpByNameAndPsw(e);
        if (emp != null){
            session.setAttribute("emp",emp);
            return true;
        }
        return false;
    }

    @Override
    public EmployeeBean getEmpById(HttpSession session) {
        EmployeeBean emp = (EmployeeBean) session.getAttribute("emp");
        return dao.getEmpById(emp.getEid());
    }

    @Override
    public List<EmployeeBean> showBean() {
        return dao.showAll();
    }

    @Override
    public boolean delEmpById(String eids) {
        String[] eid = eids.split(",");
        int row = dao.delEmpById(eid);
        if (row > 0){
            return true;
        }
        return false;
    }

    @Override
    public List<EmployeeBean> getEmpByPfk(String pFk) {
        return dao.getEmpByPfk(pFk);
    }

    @Override
    public EmployeeBean getById(Integer eid) {
        return dao.getEmpById(eid);
    }

    @Override
    public List<PositionBean> getAllPosition() {
        return pdao.getAllPosition();
    }

    @Override
    public Boolean updateEmp(EmployeeBean emp, Integer[] roles) {
        //1.修改员工表
        int r1= dao.updateEmp(emp);
        //2.删除员工对应的所有角色
        int r2=dao.delEmpRoleByEid(emp.getEid());
        //3.重新添加员工角色
        List<EmployeeBean> es=new ArrayList<>();
        for (Integer i:roles){
            EmployeeBean e=new EmployeeBean();
            e.setEid(emp.getEid());
            e.setRole(i);
            es.add(e);
        }
        int r3=dao.addRole(es);
        return true;
    }

}
