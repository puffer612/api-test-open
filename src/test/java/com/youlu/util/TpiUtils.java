package com.youlu.util;

import com.youlu.config.EnvParameters;
import org.junit.Test;
import org.yaml.snakeyaml.Yaml;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TpiUtils {

    // 正则匹配
    private static final Pattern p = Pattern.compile("\\$\\{(.+?)\\}");

    public static String parse(String content, Map<String,Object> kvs){
        Matcher m = p.matcher(content);
        StringBuffer sb = new StringBuffer();
        while (m.find()){
            String group = m.group();
            group = group.replaceAll("\\$","").replaceAll("\\{","").replaceAll("\\}","");
            Object obj = kvs.get(group);
            if(obj !=null){
                if(obj instanceof String || obj instanceof Long){
                    m.appendReplacement(sb,"\""+kvs.get(group).toString()+"\"");
                }else {
                    // YAML 处理
                    Yaml yaml = new Yaml();
                    String dumpData = yaml.dump(kvs.get(group));
                    m.appendReplacement(sb,dumpData);

                }
            }
        }
        m.appendTail(sb);
        return sb.toString();
    }


/*    @Test
    public void test2(){
        String a = "path: test002.yml\n" +
                "info: param";
        String b = parse(a,EnvParameters.mongoCache);
        System.out.println(b);
        Yaml yaml = new Yaml();
        EnvParameters.yamlCache = yaml.load(b);
        System.out.println(EnvParameters.yamlCache);
    }*/

/*    @Test
    public void test1(){
                     String aa = "   \"id\": 2059,\n" +
                            "                        \"name\": \"小白\",\n" +
                            "                        \"sex\": \"男\",\n" +
                            "                        \"age\": 28,\n" +
                            "                        \"addr\": \"河南省济源市北海大道32号\",\n" +
                            "                        \"grade\": \"天蝎座\",\n" +
                            "                        \"phone\": \"18378309272\",\n" +
                            "                        \"gold\": 10896,\n" +
                            "                        \"info\":{\n" +
                            "                            \"card\":434345432,\n" +
                            "                            \"bank_name\":'中国银行'\n" +
                            "                        }";
//        String aa = "userMobile: 18310325608" ;
        String bb = parse(aa,EnvParameters.mongoCache);
        System.out.println(bb);
        Yaml yaml = new Yaml();
        Map yet = yaml.load(aa);
        for(Object key: yet.keySet()){
            EnvParameters.mongoCache.put(key.toString(),yet.get(key));
        }
        System.out.println(EnvParameters.mongoCache.get("id"));
*//*        String a = "userMobile: ${CTX_PHONE}\n" +
                "userFlag: S";
        String name = parse(aa, EnvParameters.mongoCache);
        Map yet1 = yaml.load(name);
        System.out.println(yet1);*//*

    }*/
}
