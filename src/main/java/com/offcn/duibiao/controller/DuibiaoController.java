package com.offcn.duibiao.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.duibiao.bean.DatacollectBean;
import com.offcn.duibiao.bean.IndexvalueBean;
import com.offcn.duibiao.service.DuibiaoService;
import com.offcn.pro.bean.ProjectBean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/*
 *DuibiaoController
 *@author peizhu
 *@date 2020/4/29 14:47
 *@Version 1.0
 */
@RestController
@RequestMapping("/duibiao/")
public class DuibiaoController {
    @Resource
    private DuibiaoService service;

    @RequestMapping("showAll")
    public PageInfo<List<IndexvalueBean>> showAll(@RequestParam(value = "pageNum",defaultValue = "1",required = false) Integer pageNum,
                                                  @RequestParam(value = "pageSize",defaultValue = "5",required = false) Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<IndexvalueBean> list = service.showAll();
        PageInfo info=new PageInfo(list);
        return info;
    }

    /**获取所有最新的公司
     * @return
     */
    @RequestMapping("getDistinctCompany")
    public List<DatacollectBean>  getDistinctCompany(){

        return service.getDistinctCompany();
    }

    /**根据主键获取公司信息
     * @param daid
     * @return
     */
    @RequestMapping("getCompanyByPK")
    public DatacollectBean  getCompanyByPK(Integer daid){

        return service.getCompanyByPK(daid);
    }

    /**添加指标
     * @param in
     * @param files
     * @param session
     * @return
     */
    @RequestMapping("add")
    public  boolean  add(IndexvalueBean in, MultipartFile files, HttpSession session){
        return  service.add(in,files,session);
    }

    /**根据公司名查询公司
     * @param cname
     * @return
     */
    @RequestMapping("getComByCname")
    public List<DatacollectBean> getComByCname(String cname){
        return service.getComByCname(cname);
    }
    //根据id删除项目信息
    @RequestMapping("delById")
    public boolean delDuiById(String pids){
        return service.delDuiById(pids);
    }
 }
