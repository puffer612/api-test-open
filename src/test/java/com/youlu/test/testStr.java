package com.youlu.test;

import org.junit.Test;

public class testStr {
    @Test
    public void test1(){
//        String a = "http://192.168.10.102:7010/api/icall/call?params={\"eeUserId\":\"USER20201112220000000053\",\"eeCallouttype\":\"C\",\"phoneNumber\":\"bkhpCAiQaPC+wwRjwfmZug==\",\"scene\":\"xxxx\"}";
//        String b = "http://192.168.10.102:7020/api/icall/call?params={\"eeUserId\":\"USER20201112220000000053\",\"eeCallouttype\":\"C\",\"phoneNumber\":\"bkhpCAiQaPC+wwRjwfmZug==\",\"scene\":\"xxxx\"}";
//        assert a.equals(b);
        String[] a = {"{'aaa':'111'}","{'bbb':'222'}"};
        StringBuffer str = new StringBuffer();
        for (String s:a){
            str.append(s);
        }
        System.out.println(str);
    }
}
