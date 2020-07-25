package com.offcn.auth.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.auth.bean.EmployeeBean;
import com.offcn.auth.bean.PositionBean;
import com.offcn.auth.bean.RoleBean;
import com.offcn.auth.service.EmployeeService;
import com.offcn.auth.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/role/")
public class RoleController {
    @Autowired
    private RoleService service;

    //获取所有员工信息
    @RequestMapping("showAll")
    public PageInfo<List<RoleBean>> showAll(@RequestParam(value = "pageNum", defaultValue = "1", required = false) Integer pageNum,
                                            @RequestParam(value = "pageSize", defaultValue = "5", required = false) Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<RoleBean> list = service.showAll();
        PageInfo info = new PageInfo(list);
        return info;
    }
    @RequestMapping("getRoleByPk")
    public RoleBean  getRoleByPk(Integer roleid){

        return service.getRoleByPk(roleid);
    }


    @RequestMapping("updateRole")
    public  boolean updateRole(RoleBean role,Integer sources[]){
        return service.updateRole(role,sources);
    }
}
