package service.impl;

import model.person.Employee;
import repository.employee.IEmployeeRepository;
import repository.employee.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository employeeRepository = new EmployeeRepository();

    @Override
    public List<Employee> getListEmployees() {
        return employeeRepository.getListEmployees();
    }

    @Override
    public void addEmployee(Employee newEmployee) {
        employeeRepository.addEmployee(newEmployee);
    }

    @Override
    public Employee selectEmployee(int id) {
        return employeeRepository.selectEmployee(id);
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        return employeeRepository.updateEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) {
        return employeeRepository.deleteEmployee(id);
    }

    @Override
    public List<Employee> selectEmployeeByName(String search) {
        return employeeRepository.selectEmployeeByName(search);
    }
}
