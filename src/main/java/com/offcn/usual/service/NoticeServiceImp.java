package com.offcn.usual.service;

import com.offcn.usual.bean.NoticeBean;
import com.offcn.usual.dao.NoticeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImp implements NoticeService{
    @Autowired
    private NoticeDao dao;
    @Override
    public List<NoticeBean> showAll() {
        return dao.showAll();
    }

    @Override
    public boolean delNotById(String pids) {
        String[] pid = pids.split(",");
        int row = dao.delNotById(pids);
        if (row > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean commit(NoticeBean notice) {
        int row = dao.commit(notice);
        return row>0?true:false;
    }
}
