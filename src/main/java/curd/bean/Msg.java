package curd.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * @author lixuefeng
 * @date 2021-08-10 21:43
 * @description:
 */
public class Msg {
    private int code;
    private String msg;
    private Map<String,Object> map=new HashMap<>();

    public Msg() {
    }

    public Msg(int code, String msg, Map<String, Object> map) {
        this.code = code;
        this.msg = msg;
        this.map = map;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

    public static Msg success(){
        Msg result=new Msg();
        result.setCode(200);
        result.setMsg("成功了");
        return result;
    }
    public static Msg fail(){
        Msg result=new Msg();
        result.setCode(400);
        result.setMsg("处理失败");
        return result;
    }
    public Msg add(String key,Object object){
        this.getMap().put(key, object);
        return this;
    }
}
