package service.employee.impl;

import model.employee.Employee;
import repository.employee.IEmployeeRepository;
import repository.employee.impl.EmployeeRepository;
import service.employee.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository employeeRepository = new EmployeeRepository();

    @Override
    public List<Employee> getListEmployees() {
        return employeeRepository.showListEmployees();
    }

    @Override
    public void addEmployee(Employee newEmployee) {
        employeeRepository.addNewEmployee(newEmployee);
    }

    @Override
    public Employee selectEmployee(int id) {
        return employeeRepository.findByIdEmployee(id);
    }

    @Override
    public void updateEmployee(Employee employee) {
        return employeeRepository.updateEmployee(employee);
    }

    @Override
    public void deleteEmployee(int id) {
        return employeeRepository.deleteEmployee(id);
    }

    @Override
    public List<Employee> selectEmployeeByName(String nameE, String address, String phone) {
        return employeeRepository.search(nameE,address);
    }
}
