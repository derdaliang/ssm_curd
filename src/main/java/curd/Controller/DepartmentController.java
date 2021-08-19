package curd.Controller;

import curd.Service.DepartmentService;
import curd.bean.Department;
import curd.bean.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collection;

/**
 * @author lixuefeng
 * @date 2021-08-15 11:43
 * @description:
 */
@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;
    @ResponseBody
    @RequestMapping(value = "/depts")
    public Msg getAllDept(){
        return Msg.success().add("depts",departmentService.getAllDepartment());
    }

}
