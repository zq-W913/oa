package com.offcn.duibiao.service;

import com.offcn.auth.bean.EmployeeBean;
import com.offcn.duibiao.bean.DatacollectBean;
import com.offcn.duibiao.bean.IndexvalueBean;
import com.offcn.duibiao.dao.DuibiaoDao;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/*
 *DuibiaoServiceImpl
 *@author peizhu
 *@date 2020/4/29 14:49
 *@Version 1.0
 */
@Service
public class DuibiaoServiceImpl implements DuibiaoService {
    @Resource
    private DuibiaoDao dao;

    @Override
    public List<IndexvalueBean> showAll() {
        return dao.findAll();
    }

    @Override
    public List<DatacollectBean> getDistinctCompany() {
        return dao.getDistinctCompany();
    }

    @Override
    public DatacollectBean getCompanyByPK(Integer daid) {
        return dao.getCompanyByPK(daid);
    }

    /**添加指标
     * @param in
     * @param files
     * @param session
     * @return
     */
    @Override
    public boolean add(IndexvalueBean in, MultipartFile files, HttpSession session) {
        //1.上传文件
        String originalFilename = files.getOriginalFilename();
        //文件后缀名
        String suffix=originalFilename.substring(originalFilename.lastIndexOf("."));
        String newfileName= UUID.randomUUID()+suffix;
       String path="E://upload";
        File file=new File(path);
       if (!file.exists()){//判断文件夹是否存在，不存在创建
           file.mkdirs();
       }
        try {
            files.transferTo(new File("E://upload/"+newfileName));

            in.setInFile(newfileName);//设置文件名
            EmployeeBean emp= (EmployeeBean) session.getAttribute("emp");
            in.setEmpFk5(emp.getEid());//设置指标指定人
        } catch (IOException e) {
            e.printStackTrace();
        }

        int i=dao.addIndex(in);//执行添加
        return i>0?true:false;
    }

    @Override
    public List<DatacollectBean> getComByCname(String cname) {
        return dao.getComByCname(cname);
    }

    @Override
    public boolean delDuiById(String pids) {
        String[] pid = pids.split(",");
        int row = dao.delDuiById(pid);
        if (row > 0){
            return true;
        }
        return false;
    }
}
