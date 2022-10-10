package service.employee;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> showListEmployees();

    boolean addEmployee(Employee newEmployee);

    Employee findById(int id);

    void updateEmployee(Employee employee);

   void deleteEmployee(int id);

   List<Employee> search(String nameE, String addresE, String phoneE);
}
