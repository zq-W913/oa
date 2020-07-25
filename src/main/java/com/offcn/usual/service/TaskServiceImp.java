package com.offcn.usual.service;

import com.offcn.auth.bean.EmployeeBean;
import com.offcn.usual.bean.TaskBean;
import com.offcn.usual.dao.TaskDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
@Service
public class TaskServiceImp implements TaskService {
    @Autowired
    private TaskDao dao;
    @Override
    public List<TaskBean> showAll() {
        return dao.showAll();
    }

    @Override
    public boolean delTaskById(String pids) {
        String[] pid = pids.split(",");
        int row = dao.delTaskById(pids);
        if (row > 0){
            return true;
        }
        return false;
    }
    @Override
    public boolean commit(TaskBean task, HttpSession session) {
        EmployeeBean emp = (EmployeeBean) session.getAttribute("emp");
        task.setEmpFk(emp.getEid());
        int row = dao.commit(task);
        return row>0?true:false;
    }

    @Override
    public List<TaskBean> getTaskById(HttpSession session) {
        EmployeeBean emp = (EmployeeBean) session.getAttribute("emp");
        return dao.getTaskById(emp.getEid());
    }
}
