package com.offcn.msg.service;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.offcn.msg.bean.MsgBean;
import com.offcn.msg.bean.MsgBean;
import org.apache.commons.dbutils.QueryRunner;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;
import java.sql.SQLException;


/*创建任务
 *MyJob
 *@author peizhu
 *@date 2020/4/26 15:54
 *@Version 1.0
 */
public class MyJob  implements Job {
    /**到了时间以后将msgBean插入表中
     * @param jobExecutionContext
     * @throws JobExecutionException
     */
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        //获取调度器中传过来的参数，将消息插入表中
        MsgBean msg= (MsgBean) jobExecutionContext.getJobDetail().getJobDataMap().get("msg");

        ApplicationContext app=new ClassPathXmlApplicationContext("spring/spring_core.xml");
        ComboPooledDataSource ds= (ComboPooledDataSource) app.getBean("ds");

        QueryRunner qr=new QueryRunner(ds);
        try {
            qr.update("insert msg(sendp,recvp,msgcontent,msgtime)values(?,?,?,?)",msg.getSendp(),msg.getRecvp(),
                    msg.getMsgcontent(),msg.getMsgtime());
            System.out.println("插入成功");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("插入失败");
        }


    }
}
