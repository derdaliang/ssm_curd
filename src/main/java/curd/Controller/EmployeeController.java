package curd.Controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import curd.Service.EmployeeService;
import curd.bean.Employee;
import curd.bean.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author lixuefeng
 * @date 2021-07-20 22:24
 * @description:员工控制
 */
@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @ResponseBody
    @RequestMapping("/list")
    public ModelAndView getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,5);
        List<Employee> emps=employeeService.getAll();
        PageInfo pageInfo = new PageInfo(emps,5);
        model.addAttribute("pageInfo",pageInfo);
        ModelAndView modelAndView=new ModelAndView("list");
        return modelAndView;
    }


    @RequestMapping(value = "/emps")
    @ResponseBody
    public Msg testJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Employee> emps=employeeService.getAll();
        PageInfo pageInfo = new PageInfo(emps,5);
//        return pageInfo;
        return Msg.success().add("pageInfo",pageInfo);
    }
    @ResponseBody
    @RequestMapping(value = "/emps",method = RequestMethod.POST)
    public Msg saveEmps(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            Map<String,Object> map=new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for(FieldError fieldError:fieldErrors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else{
            employeeService.save(employee);
            return Msg.success();
        }

    }
    @ResponseBody
    @RequestMapping(value = "/checkUser")
    public Msg checkEmpName(@RequestParam("empName") String empName){
        String regName="((^[a-zA-Z0-9_-]{6,16}$)|^([\\u2E80-\\u9FFF],{3,5}))";
        if(!empName.matches(regName)) {
            return Msg.fail().add("va_msg", ".setMsg(\"用户名必须是6~16为英文或\")");
        }
        if(employeeService.checkUser(empName)){
            return Msg.success().add("va_msg","用户名可用");
        }else{
            return Msg.fail().add("va_msg","不可重复");
        }
    }

    @ResponseBody
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    public Msg selectById(@PathVariable("id")Integer id){
        Employee employee=employeeService.selectById(id);
        return Msg.success().add("emp",employee);
    }

    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg SaveEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    /**
     * 删除员工
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{empIds}",method = RequestMethod.DELETE)
    public Msg DeleteEmp(@PathVariable(value = "empIds")String ids){
        if(ids.contains(",")){
            List<Integer> list=new ArrayList<>();
            String[] str_ids=ids.split(",");
            //组装id
            for(String str:str_ids){
                list.add(Integer.parseInt(str));
            }
            employeeService.deleteBatch(list);
        }else{
            employeeService.deleteById(Integer.parseInt(ids));
        }
        return Msg.success();
    }
}
