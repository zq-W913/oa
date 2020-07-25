package com.offcn.msg.service;

import com.offcn.auth.bean.EmployeeBean;
import com.offcn.msg.bean.MsgBean;
import com.offcn.msg.dao.MsgDao;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Service
public class MsgServiceImp implements MsgService{
    @Autowired
    private MsgDao dao;
    @Override
    public List<MsgBean> showAll() {
        return dao.showAll();
    }

    @Override
    public boolean delMsgById(String pids) {
        String[] pid = pids.split(",");
        int row = dao.delMsgById(pid);
        if (row > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean save(MsgBean msg, HttpSession session) {
        EmployeeBean emp= (EmployeeBean) session.getAttribute("emp");
        //发送人
        msg.setSendp(emp.getEid());

        try {
            //1.创建任务调度工厂
            SchedulerFactory factory=new StdSchedulerFactory();
            //2.获取任务调度器
            Scheduler scheduler=factory.getScheduler();
            //3.创建任务
            JobDetail jobDetail= JobBuilder.newJob(MyJob.class).build();
            //4.往任务中传值
            jobDetail.getJobDataMap().put("msg",msg);

            String time=msg.getMsgtime();
            SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            Date date=sm.parse(time);
            //5.创建触发器
            Trigger trigger= TriggerBuilder.newTrigger().withSchedule(SimpleScheduleBuilder.simpleSchedule())
                    .startAt(date).build();

            //将触发器和任务放入任务调度器中
            scheduler.scheduleJob(jobDetail,trigger);

            //6.启动调度器
            if(!scheduler.isShutdown()){//isShutdown() 在执行的时候直接将任务关闭，同时返货是否关闭
                System.out.println("开启定时任务");
                scheduler.start();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }
}
