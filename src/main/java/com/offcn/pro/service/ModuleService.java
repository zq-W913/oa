package com.offcn.pro.service;

import com.offcn.pro.bean.ModuleBean;

import java.util.List;

public interface ModuleService {
    List<ModuleBean> showAll();

    boolean delMOdById(String pids);

    boolean commit(ModuleBean module);

    ModuleBean getModuleByPk(Integer id);

    boolean update(ModuleBean module);

    List<ModuleBean> getModuleByid(Integer id);
}
