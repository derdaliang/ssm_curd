package curd.Service;

import curd.bean.Department;
import curd.bean.Employee;
import curd.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;
    public Collection<Department> getAllDepartment(){
        return departmentMapper.selectByExample(null);
    }
}
