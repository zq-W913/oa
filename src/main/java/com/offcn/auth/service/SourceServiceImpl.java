package com.offcn.auth.service;

import com.offcn.auth.bean.EmployeeBean;
import com.offcn.auth.bean.RoleSourcesBean;
import com.offcn.auth.bean.SourcesBean;
import com.offcn.auth.dao.SourceDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/*
 *SourceServiceImpl
 *@author peizhu
 *@date 2020/4/28 11:38
 *@Version 1.0
 */
@Service
public class SourceServiceImpl implements  SourceService {
    @Resource
    private SourceDao dao;
    @Override
    public List<SourcesBean> showAll() {
        return dao.findAll();
    }

    @Override
    public List<RoleSourcesBean> getSourceByRoleid(Integer roleid) {
        return dao.getSourceByRoleid(roleid);
    }
    /**根据当前登录人获取权限
     * @param session
     * @return
     */
    @Override
    public SourcesBean getSourceByEid(HttpSession session) {
        EmployeeBean emp= (EmployeeBean) session.getAttribute("emp");
        List<SourcesBean> list = dao.getSourceByEid(emp.getEid());
        //整理数据，形成父子菜单关系

        //1.找到最外层菜单  pid=0
        SourcesBean s1=null;
        for (SourcesBean s:list){
            if (s.getPid()==0){
                s1=s;
                break;
            }
        }
        //找到最外层菜单的儿子children
        for(SourcesBean s2:list){
            //找到最外层的children
            if(s2.getPid()==s1.getId()){//二级菜单找到
                s1.getChildren().add(s2);

                for (SourcesBean s3:list){
                    if (s3.getPid()==s2.getId()){//三级菜单
                        s2.getChildren().add(s3);
                    }
                }
            }

        }
        return s1;
    }
}
