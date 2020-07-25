package com.offcn.pro.service;

import com.offcn.pro.bean.ModuleBean;
import com.offcn.pro.dao.ModuleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ModuleServiceImp implements ModuleService {
    @Autowired
    private ModuleDao dao;
    @Override
    public List<ModuleBean> showAll() {
        return dao.showAll();
    }

    @Override
    public boolean delMOdById(String pids) {
        String[] pid = pids.split(",");
        int row = dao.delModById(pids);
        if (row > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean commit(ModuleBean module) {
        System.out.println(module);
        int row = dao.commit(module);
        System.out.println(row);
        return row>0?true:false;
    }

    @Override
    public ModuleBean getModuleByPk(Integer id) {
        return dao.getModuleByPk(id);
    }

    @Override
    public boolean update(ModuleBean module) {
        int row = dao.update(module);
        return row>0?true:false;
    }

    @Override
    public List<ModuleBean> getModuleByid(Integer id) {
        return dao.getModuleByid(id);
    }
}
