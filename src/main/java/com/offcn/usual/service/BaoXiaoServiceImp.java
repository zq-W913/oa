package com.offcn.usual.service;


import com.offcn.auth.bean.EmployeeBean;
import com.offcn.usual.bean.BaoxiaoBean;
import com.offcn.usual.bean.ExpendituretypeBean;
import com.offcn.usual.dao.BaoRepDao;
import com.offcn.usual.dao.BaoxiaoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
@Service
public class BaoXiaoServiceImp implements BaoXiaoService {
    @Autowired
    private BaoxiaoDao dao;
    @Autowired
    private BaoRepDao pdao;
    @Override
    public List<BaoxiaoBean> showAll() {
        return dao.showAll();
    }

    @Override
    public BaoxiaoBean getBxById(String bxid) {
        return dao.getBxById(bxid);
    }

    @Override
    public boolean commit(BaoxiaoBean bao) {
        int row1 = dao.commit(bao);
        int row2 = pdao.addReplay(bao);
        return (row1>0&&row2>0)?true:false;
    }

    @Override
    public List<BaoxiaoBean> getBxByEid(HttpSession session) {
        EmployeeBean emp = (EmployeeBean) session.getAttribute("emp");
        return dao.getBxByEid(emp.getEid());
    }

    @Override
    public List<ExpendituretypeBean> getAllBxModel() {
        return dao.getAllBxModel();
    }

    @Override
    public boolean updata(BaoxiaoBean bao) {
        int row = dao.updata(bao);
        return row>0?true:false;
    }
}
