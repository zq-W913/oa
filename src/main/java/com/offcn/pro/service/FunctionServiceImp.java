package com.offcn.pro.service;

import com.offcn.pro.bean.FunctionBean;
import com.offcn.pro.dao.FunctionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FunctionServiceImp implements FunctionService {
    @Autowired
    private FunctionDao dao;
    @Override
    public List<FunctionBean> showAll(Integer make) {
        return dao.showAll();
    }

    @Override
    public boolean delFunById(String pids) {
        String[] pid = pids.split(",");
        int row = dao.delFunById(pid);
        if (row > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean commit(FunctionBean function) {
        int row = dao.commit(function);
        return row>0?true:false;
    }

    @Override
    public List<FunctionBean> getFunByMid(Integer id) {
        return dao.getFunByMid(id);
    }
}
