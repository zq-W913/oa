package com.offcn.cus.dao;

import com.offcn.auth.bean.EmployeeBean;
import com.offcn.cus.bean.CustomerBean;
import com.offcn.util.SearchBean;

import java.util.List;

public interface CustomerDao {

    List<CustomerBean> showAll(SearchBean search);

    int delCusById(String[] eid);

    int uploadExcel(List<CustomerBean> cus);

    CustomerBean selCusById(int id);
}
