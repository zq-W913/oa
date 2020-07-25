package com.offcn.pro.service;

import com.offcn.pro.bean.AnalysisBean;
import com.offcn.pro.dao.AnalysisDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AnalysisServiceImp implements AnalysisService{
    @Autowired
    private AnalysisDao dao;
    @Override
    public List<AnalysisBean> showAll() {
        return dao.showAll();
    }

    @Override
    public boolean delAnyById(String pids) {
        String[] pid = pids.split(",");
        int row = dao.delanyById(pids);
        if (row > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean commit(AnalysisBean analysis) {
        int row = dao.commit(analysis);
        return row>0?true:false;
    }

    @Override
    public AnalysisBean getAnyByPK(Integer id) {
        return dao.getAnyByPK(id);
    }

    @Override
    public boolean updata(AnalysisBean analysis) {
        int row = dao.updata(analysis);
        return row>0?true:false;
    }
}
