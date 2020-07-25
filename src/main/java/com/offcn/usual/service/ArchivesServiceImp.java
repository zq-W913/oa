package com.offcn.usual.service;

import com.offcn.usual.bean.ArchivesBean;
import com.offcn.usual.dao.ArchivesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ArchivesServiceImp implements ArchivesService{
    @Autowired
    private ArchivesDao dao;
    @Override
    public List<ArchivesBean> showAll() {
        return dao.showAll();
    }

    @Override
    public boolean delArcById(String pids) {
        String[] pid = pids.split(",");
        int row = dao.delArcById(pid);
        if (row > 0){
            return true;
        }
        return false;
    }
}
