package com.offcn.auth.controller;

import com.offcn.auth.bean.RoleSourcesBean;
import com.offcn.auth.bean.SourcesBean;
import com.offcn.auth.service.SourceService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/*
 *SourceController
 *@author peizhu
 *@date 2020/4/28 11:36
 *@Version 1.0
 */
@RestController
@RequestMapping("/source/")
public class SourceController {
    @Resource
    private SourceService service;

    @RequestMapping("showAll")
    public List<SourcesBean> getAllSource(){
        return service.showAll();
    }

    /**根据角色id查询角色拥有的权限
     * @param roleid
     * @return
     */
    @RequestMapping("getSourceByRoleid")
    public List<RoleSourcesBean> getSourceByRoleid(Integer roleid){
        return  service.getSourceByRoleid(roleid);
    }
    /**根据当前登录人或者权限
     * @param session
     * @return
     */
    @RequestMapping("getSourceByEid")
    public SourcesBean  getSourceByEid(HttpSession session){

        return  service.getSourceByEid(session);
    }
}
