package com.offcn.auth.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.auth.bean.EmployeeBean;
import com.offcn.auth.bean.PositionBean;
import com.offcn.auth.bean.RoleBean;
import com.offcn.auth.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/emp/")
public class EmployeeController {
    @Autowired
    private EmployeeService service;
    //登录验证
    @RequestMapping("login")
    public boolean login(EmployeeBean e, HttpSession session){
        return service.login(e,session);
    }
    //通过id获取员工信息
    @RequestMapping("info")
    public EmployeeBean getEmpById(HttpSession session){
        return service.getEmpById(session);
    }
    //获取所有员工信息
    @RequestMapping("user")
    public PageInfo<List<EmployeeBean>> showAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                                @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        System.out.println(pageNum+"-----"+pageSize);
        PageHelper.startPage(pageNum,pageSize);
        List<EmployeeBean> list = service.showBean();
        PageInfo info=new PageInfo(list);
        return info;
    }
    //通过1d删除员工
    @RequestMapping("delById")
    public boolean delEmpById(String eids){
        return service.delEmpById(eids);
    }
    @RequestMapping("getEmpByPfk")
    public List<EmployeeBean> getEmpByPfk(String pFk){
        return service.getEmpByPfk(pFk);
    }
    @RequestMapping("getById")
    public EmployeeBean getEmpById(Integer eid){
        return service.getById(eid);
    }
    //获取所有的职位
    @RequestMapping("getAllPosition")
    public List<PositionBean> getAllPosition(){
        return service.getAllPosition();
    }
    @RequestMapping("updateEmp")
    public Boolean  updateEmp(EmployeeBean emp,Integer roles[]){
        return  service.updateEmp(emp,roles);
    }
}
