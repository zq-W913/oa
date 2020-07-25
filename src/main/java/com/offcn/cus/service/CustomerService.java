package com.offcn.cus.service;

import com.offcn.auth.bean.EmployeeBean;
import com.offcn.cus.bean.CustomerBean;
import com.offcn.util.SearchBean;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface CustomerService {

    List<CustomerBean> showBean(SearchBean search);

    boolean delCusById(String eids);

    boolean uploadExcel(MultipartFile file);

    String downExcel();

    CustomerBean getCusByPk(int id);
}
