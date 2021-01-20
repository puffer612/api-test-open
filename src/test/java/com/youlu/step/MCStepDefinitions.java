package com.youlu.step;

import com.youlu.config.EnvParameters;
import com.youlu.util.ApiUtils;
import com.youlu.util.TpiUtils;
import com.youlu.util.YamlUtils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.response.Response;
import org.yaml.snakeyaml.Yaml;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.assertEquals;

public class MCStepDefinitions {
    private String api;
    private Response response;
    private Object apis;
    private Map<String,Object> cookie = new HashMap<>();
    private Map<String,Object> header = new HashMap<>();
    private Map<String,Object> params = new HashMap<>();

    @Given("token_value")
    public void step1(String content){
        Yaml yaml = new Yaml();
        Map yet = yaml.load(content);
        for(Object key: yet.keySet()){
            EnvParameters.mongoCache.put(key.toString(),yet.get(key));
        }
    }
    @Given("api {string}")
    public void stepApi(String apiPath){
        api = apiPath;
//        api = "http://192.168.11.206:8081/apiservice"+apiPath;
    }

    @Given("param")
    public void step2(String content){
        String value = TpiUtils.parse(content,EnvParameters.mongoCache);
        Yaml yaml = new Yaml();
        Map map = yaml.load(value);
        params = map;
    }
    @Given("yamlParam")
    public void step3(String content){
        String value = TpiUtils.parse(content,EnvParameters.mongoCache);
        Yaml yaml = new Yaml();
        EnvParameters.yamlCache = yaml.load(value);
        Object obj = YamlUtils.getTestData(EnvParameters.yamlCache.get("path")).get(EnvParameters.yamlCache.get("info"));
        apis = obj;

    }
    @Given("CookieX")
    public void setToken(Map<String,Object> paramsTmp){
        Map<String,Object> tmp = new HashMap<>();
        paramsTmp.forEach((key,value) -> {
            // 验证是否包含函数表达式
            String valueTmp = value.toString();
            if (value.toString().contains("${")){
                String keyVal = valueTmp.substring(2, valueTmp.length() - 1);
                tmp.put(key, EnvParameters.mongoCache.get(keyVal));
            }else {
                tmp.put(key, value);
            }
        });
        this.cookie = tmp;
    }

    @When("get")
    public void stepWhen(){
        response = ApiUtils.getResponse(api,cookie,header,params);
    }
    @When("getMore")
    public void stepWhenList(){
        response = ApiUtils.getResponseList(api,apis,cookie,header);
    }


    /**
     * 断言状态码
     */
    @Then("^STATUS \"(.*?)\"$")
    public void status(int status){
        assertEquals(this.response.statusCode(),status);
    }
    /**
     * JSON 断言
     * @param jsonPath jsonpath
     * @param value 断言值
     */
    @Then("^JSONPATH_ASSERT \"(.*?)\" equals \"(.*?)\"$")
    public void jsonPathAssert(String jsonPath,String value){
//        String apiResp = ApiUtils.getJsonPathValue(this.response, jsonPath);
        String apiResp = ApiUtils.getJsonPathNotResponse(this.response, jsonPath);
        assert apiResp.equals(value);
    }

    /**
     * json 提取 (嵌入式 Mongo)
     */
    @Then("JSONPATH_GET_MONGO")
    public void jsonPathGet(Map<String,Object> paramsTmp){
        paramsTmp.forEach((key,value) -> EnvParameters.mongoCache.put(value.toString(), ApiUtils.getJsonPathObject(this.response,key)));
    }
/*    *//*
    * 断言是个object
    * *//*
    @Then("JSONPATH_ASSERT_OBJECT \"(.*?)\" equals \"(.*?)\"$")
    public void jsonPathObjectAssert(String jsonPath,String value){
        Object obj = ApiUtils.getJsonPathObjects(this.response,jsonPath);
        assert obj.equals(value);
    }*/
}
