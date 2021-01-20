package com.youlu.util;

import com.jayway.jsonpath.JsonPath;
import com.youlu.config.EnvParameters;
import io.restassured.response.Response;

import java.util.Map;

import static io.restassured.RestAssured.given;

public class ApiUtils {

    /*
    * 获取response
    * */
    public static Response getResponse(String apiPath, Map<String,Object> cookies,
                                       Map<String,Object> headers,Map<String,Object> params){
        //验证 API HOST
        if (!apiPath.startsWith("http") && !apiPath.startsWith("https")) {
            // 通过环境变量注入
            apiPath = EnvParameters.getHostEnv() + apiPath;
        }
        // 验证 环境编码
        if(EnvParameters.getEnvCode() != null) {
            headers.put("env",EnvParameters.getEnvCode());
        }
        Response response = given().contentType("application/json;charset=UTF-8")
                .param("params",params)
                .headers(headers)
                .cookies(cookies)
                .when().log().all().get(apiPath.trim());
//        System.out.println("返回的响应是："+response.getBody().prettyPrint());
        return response;
    }

    /*
     * 获取response
     * */
    public static Response getResponseList(String apiPath, Object apis,Map<String,Object> cookies,
                                       Map<String,Object> headers){
        //验证 API HOST
        if (!apiPath.startsWith("http") && !apiPath.startsWith("https")) {
            // 通过环境变量注入
            apiPath = EnvParameters.getHostEnv() + apiPath;
        }
        // 验证 环境编码
        if(EnvParameters.getEnvCode() != null) {
            headers.put("env",EnvParameters.getEnvCode());
        }
        Response response = given().contentType("application/json;charset=UTF-8")
                .param("apis",apis)
                .headers(headers)
                .cookies(cookies)
                .when().log().all().get(apiPath.trim());
//        System.out.println("返回的响应是："+response.getBody().prettyPrint());
        return response;
    }


    /**
     * 获取json中某个key值
     *
     * @param response 接口返回
     * @param JsonPath jsonpath, 例如 a.b.c   a.b[1].c  a
     * @return
     */

    public static String getJsonPathValue(Response response,String JsonPath){
        Object obj = response.jsonPath().get(JsonPath);
        return String.valueOf(obj);
    }

    public static Object getJsonPathObject(Response response,String JsonPath){
        return response.jsonPath().get(JsonPath);
    }

   /*
   * 用JsonPath 不用response 带的
   * */
    public static String getJsonPathNotResponse(Response response,String jsonPath){
        String values = JsonPath.parse(response.getBody().prettyPrint()).read(jsonPath);
        return values;
    }

/*    public static Object getJsonPathObjects(Response response,String jsonPath){
        String jsons = response.getBody().prettyPrint();
        return JsonPath.read(jsons,jsonPath);
    }*/
}
