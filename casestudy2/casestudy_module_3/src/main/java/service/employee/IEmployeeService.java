package service.employee;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> getListEmployees();

    void addEmployee(Employee newEmployee);

    Employee selectEmployee(int id);

    boolean updateEmployee(Employee employee);

    boolean deleteEmployee(int id);

    List<Employee> selectEmployeeByName(String search);
}
