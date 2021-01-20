package com.youlu.test;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.yaml.snakeyaml.Yaml;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class testYaml {
    /*
     * 把测试数据放到一个ymal文件中
     * */
    public static Map<String, Object> getTestData(String path) {
        Map<String, Object> map = new HashMap<>();
        Yaml yaml = new Yaml();
        URL url = testYaml.class.getClassLoader().getResource("yaml/" + path);
        if (url != null) {
            try {
                map = yaml.load(new FileInputStream(url.getFile()));
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
        }

        return map;
    }
}

/*
    @Test
    public void test1() {
        Object obj = getTestData("test002.yml").get("param");
        ArrayList al = (ArrayList) obj;
        System.out.println(al);
        for(Object o:al){
            System.out.println(o.toString());
        }
        System.out.println(obj.getClass().toString());
*/

/*        Map<String, Object> map = getTestData("test001.yml");
        System.out.println(map);
        JSONObject json = JSONObject.fromObject(map);
        JSONArray arry = (JSONArray) json.get("userInfo");
     for(int i=0;i<arry.size();i++){
        JSONObject jsons = arry.getJSONObject(i);
         System.out.println(jsons);
     }*/
//        System.out.println(array.get("userInfo").getClass().toString());
//        System.out.println(array);
//        Map<String, Object> data = (Map<String, Object>) map.get("userInfo");
//        System.out.println(data.get("user_list"));

//    }
//}
