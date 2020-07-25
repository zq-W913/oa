package com.offcn.pro.dao;

import com.offcn.pro.bean.ModuleBean;

import java.util.List;

public interface ModuleDao {
    List<ModuleBean> showAll();

    int delModById(String pids);

    int commit(ModuleBean module);

    ModuleBean getModuleByPk(Integer id);

    int update(ModuleBean module);

    List<ModuleBean> getModuleByid(Integer id);
}
