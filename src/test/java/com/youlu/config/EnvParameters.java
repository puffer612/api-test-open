package com.youlu.config;

import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

public class EnvParameters {
    public static String getHostEnv(){
        return System.getenv("API_HOST");
    }
    public static String getDBEnv(){
        return System.getenv("DB_HOST");
    }

    // 缓存数据放到一个map集合中
    public static Map<String,Object> mongoCache = new HashMap<>();

    /*
    * 环境编码
    * @return
    * */
    public static String getEnvCode(){
        return System.getenv("ENV_CODE");
    }

    /*
    * 把yaml 数据放到这里面
    * */
    public static Map<String,String> yamlCache = new HashMap<>();


/*    @Test
    public void tes1(){
        String host = getHostEnv();
        System.out.println(host);
    }*/
}
