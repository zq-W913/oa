package com.offcn.cus.service;


import com.offcn.cus.bean.CustomerBean;
import com.offcn.cus.dao.CustomerDao;
import com.offcn.util.SearchBean;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class CustomerServiceImp implements CustomerService {
    @Autowired
    private CustomerDao dao;

    @Override
    public List<CustomerBean> showBean(SearchBean search) {
        return dao.showAll(search);
    }

    @Override
    public boolean delCusById(String ids) {
        String[] id = ids.split(",");
        int row = dao.delCusById(id);
        if (row > 0){
            return true;
        }
        return false;
    }

    @Override
    public boolean uploadExcel(MultipartFile file) {
        List<CustomerBean> cus = new ArrayList<>();
        try {
            InputStream inputStream = file.getInputStream();
            Workbook wk = null;
            String filename = file.getOriginalFilename();
            System.out.println(filename);
            String suffix=filename.substring(filename.lastIndexOf("."));
            System.out.println(suffix);
            if (".xls".equals(suffix)){
                wk=new HSSFWorkbook(inputStream);   //  excel 2003版本的
                System.out.println("2222");
            }else if (".xlsx".equals(suffix)){
                wk=new XSSFWorkbook(inputStream);   // excel  2007 版本的
            }else{
                /*System.out.println("文件类型错误，不是excel文件");
                return false;*/
                throw new RuntimeException("文件类型错误，不是excel文件");
            }
            for (int i=0; i<wk.getNumberOfSheets(); i++){
                Sheet sheetAt = wk.getSheetAt(i);
                if(null==sheetAt||sheetAt.getLastRowNum()==0)continue;
                for (int j=1;j<=sheetAt.getLastRowNum();j++){
                    Row row = sheetAt.getRow(j);
                    CustomerBean cu = new CustomerBean();
                    cu.setComname(row.getCell(0).getStringCellValue());
                    cu.setCompanyperson(row.getCell(1).getStringCellValue());
                    cu.setComphone(row.getCell(2).getStringCellValue());
                    cu.setComaddress(row.getCell(3).getStringCellValue());
                    cu.setPresent(row.getCell(4).getStringCellValue());
                    cu.setRemark(row.getCell(5).getStringCellValue());
                    cu.setCreatetime(row.getCell(6).getDateCellValue());
                    System.out.println(row.getCell(6).getDateCellValue());

                    cus.add(cu);

                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(cus);
        int res=dao.uploadExcel(cus);
        System.out.println(res);
        return res>0?true:false;
    }

    @Override
    public String downExcel() {
        List<CustomerBean> list = dao.showAll(new SearchBean());
        Workbook wk=new HSSFWorkbook();//生成  ---2003版本的 .xls的excel
        //创建一页表格,名称叫做客户信息
        Sheet sheet = wk.createSheet("客户信息");

        //创建一行表头-============表头开始========
        Row row1 = sheet.createRow(0);
        Cell cell_1_0 = row1.createCell(0);//第一行的第一列
        cell_1_0.setCellValue("公司名称");

        Cell cell_1_1 = row1.createCell(1);//第一行的第2列
        cell_1_1.setCellValue("负责人");

        Cell cell_1_2 = row1.createCell(2);//第一行的第3列
        cell_1_2.setCellValue("电话");

        Cell cell_1_3 = row1.createCell(3);//第一行的第4列
        cell_1_3.setCellValue("地址");

        Cell cell_1_4 = row1.createCell(4);//第一行的第5列
        cell_1_4.setCellValue("简介");

        Cell cell_1_5 = row1.createCell(5);//第一行的第6列
        cell_1_5.setCellValue("时间");
        //================表头结束=====================
        //添加数据行=======添加数据行开始============
        for (int i=0;i<list.size();i++){
            CustomerBean cus=list.get(i);
            Row row = sheet.createRow(i + 1);//从第二行开始创建

            Cell c0 = row.createCell(0);
            c0.setCellValue(cus.getComname());

            Cell c1 = row.createCell(1);
            c1.setCellValue(cus.getCompanyperson());

            Cell c2 = row.createCell(2);
            c2.setCellValue(cus.getComphone());

            Cell c3 = row.createCell(3);
            c3.setCellValue(cus.getComaddress());

            Cell c4 = row.createCell(4);
            c4.setCellValue(cus.getPresent());

            Cell c5 = row.createCell(5);
            c5.setCellValue(cus.getAddtime());

        }
        //=============添加数据结束==============
        //创建excel文件
        String filename= UUID.randomUUID()+".xls";
        try {
            OutputStream oos= new FileOutputStream("E://upload/"+filename);
            wk.write(oos);//将excel写到输出流中
        } catch (IOException e) {
            e.printStackTrace();
        }


        return filename;

    }

    @Override
    public CustomerBean getCusByPk(int id) {
        return dao.selCusById(id);
    }
}
