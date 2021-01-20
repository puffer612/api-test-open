package com.youlu.util;
/*import okhttp3.*;
import okio.ByteString;
import org.junit.Test;

import java.io.IOException;

public class WebSockets extends WebSocketListener {
    */



    /**
     * 接受websocket服务端的值.
     */
/*
    private static String receiveData = null;

    @Override
    public void onOpen(WebSocket webSocket, Response response) {
        super.onOpen(webSocket,response);
        webSocket.send("{\"timestamp\":1609644557018,\"flag\":\"Q4S\",\"type\":\"push.heartbeat\"}");
    }
    @Override
    public void onMessage(WebSocket webSocket,String text){
            super.onMessage(webSocket,text);
            setValue(text);
    }
   @Override
    public void onMessage(WebSocket webSocket,ByteString text){
        super.onMessage(webSocket,text);
   }
   @Override
    public void onFailure(WebSocket webSocket, Throwable t, Response response){
       super.onFailure(webSocket, t, response);
       try {
           if (null != response) {
               int code = response.code();
               System.out.println("onFailure code:" + code);
               System.out.println("onFailure body:" + response.body().string());
               if (101 != code) {
                   System.out.println("connection failed");
                   System.exit(0);
               }
           }
       } catch (IOException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
       }
   }

   // 设置消息
    public  void setValue(String value){
        receiveData = value;
    }
    //返回消息
    public String getValue(){
        return receiveData;
    }

   @Test
    public void test1() throws Exception{
        String url = "ws://192.168.10.54:8051/?params={%22clientId%22:%22USER20201116220000000061%22,%22authType%22:%22userId%22,%22terminal%22:%22ADMIN.WEB%22,%22authParams%22:{%22token%22:%22b6ee1037b16dbcd2d72f5d1858c802b9%22,%22param%22:%22C828FC0A2FF9D16D0EE4BF650589FBD92572BD8DBF0C1A258B4482B59F5FBE64%22}}";
        OkHttpClient client = new OkHttpClient.Builder().build();
        Request request = new Request.Builder().url(url).build();
        client.newWebSocket(request,new WebSockets());
        while (true){
            Thread.sleep(2000);
            System.out.println(getValue());
           }
   }
}*/

import org.junit.Test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class WebSockets{
    /*
    * java 调用python 脚本
    * */
    @Test
    public  void getValue(){
        Process proc;
        try {
            proc = Runtime.getRuntime().exec("python C:/Users/Administrator/Desktop/aaa.py");
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String line = null;
            while ((line = in.readLine()) != null) {
                System.out.println(line);
            }
            in.close();
            proc.waitFor();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
