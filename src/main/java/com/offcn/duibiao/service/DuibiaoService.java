package com.offcn.duibiao.service;

import com.offcn.duibiao.bean.DatacollectBean;
import com.offcn.duibiao.bean.IndexvalueBean;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface DuibiaoService {
    List<IndexvalueBean> showAll();

    List<DatacollectBean> getDistinctCompany();

    DatacollectBean getCompanyByPK(Integer daid);

    boolean add(IndexvalueBean in, MultipartFile files, HttpSession session);

    List<DatacollectBean> getComByCname(String cname);

    boolean delDuiById(String pids);
}
