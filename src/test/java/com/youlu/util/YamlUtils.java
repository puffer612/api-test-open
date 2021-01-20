package com.youlu.util;

import com.youlu.test.testYaml;
import org.yaml.snakeyaml.Yaml;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

public class YamlUtils {

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
