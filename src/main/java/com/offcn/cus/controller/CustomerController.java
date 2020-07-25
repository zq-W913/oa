package com.offcn.cus.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.auth.bean.EmployeeBean;
import com.offcn.auth.service.EmployeeService;
import com.offcn.cus.bean.CustomerBean;
import com.offcn.cus.service.CustomerService;
import com.offcn.util.SearchBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/cus/")
public class CustomerController {
    @Autowired
    private CustomerService service;
    //获取所有员工信息
    @RequestMapping("showAll")
    public PageInfo<List<CustomerBean>> showAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                                @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize,
                                                SearchBean search){
        PageHelper.startPage(pageNum,pageSize);//自动在原有sql语句后面加上sql的分页语句
        List<CustomerBean> list = service.showBean(search);
        PageInfo info=new PageInfo(list);
        return info;
    }
    //通过1d删除员工
    @RequestMapping("delById")
    public boolean delEmpById(String eids){
        return service.delCusById(eids);
    }
    //excel导入
    @RequestMapping("uploadExcel")
    public boolean uploadExcel(MultipartFile file){
        System.out.println(file);
        return service.uploadExcel(file);
    }
    //excel导出
    @RequestMapping("downExcel")
    public String downExcel(){
        return service.downExcel();
    }
    @RequestMapping("getCusByPk")
    public CustomerBean getCusByPk(int id){
        return service.getCusByPk(id);
    }
}
