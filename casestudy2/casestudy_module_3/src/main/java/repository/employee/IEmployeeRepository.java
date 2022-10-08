package repository.employee;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> showListEmployees();

    void addNewEmployee(Employee newEmployee);

    Employee findByIdEmployee(int id);

    void updateEmployee(Employee employee);

    void deleteEmployee(int id);

    List<Employee> search(String nameE, String addressE, String phoneE );
}
