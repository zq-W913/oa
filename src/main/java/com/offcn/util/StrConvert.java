package com.offcn.util;

import org.springframework.core.convert.converter.Converter;
public class StrConvert implements Converter<String,String> {
    /*
        自己定义的忽略表单参数空格
     */
    @Override
    public String convert(String s) {
        if (null==s) return null;

        return s.trim();
    }
}
