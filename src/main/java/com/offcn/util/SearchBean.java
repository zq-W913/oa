package com.offcn.util;

public class SearchBean {
    private int  type;//按照某种条件(类型)搜索  0 没有搜索关键字 ，1公司名，2,联系人
    private String keyword;//关键字
    private int  orderby;//编号 1升序，2降序

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public int getOrderby() {
        return orderby;
    }

    public void setOrderby(int orderby) {
        this.orderby = orderby;
    }
}
