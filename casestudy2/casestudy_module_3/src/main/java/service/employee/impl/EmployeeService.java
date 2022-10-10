package service.employee.impl;

import model.employee.Employee;
import repository.employee.IEmployeeRepository;
import repository.employee.impl.EmployeeRepository;
import service.employee.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository employeeRepository = new EmployeeRepository();

    @Override
    public List<Employee> showListEmployees() {
        return employeeRepository.showListEmployees();
    }

    @Override
    public boolean addEmployee(Employee newEmployee) {
        employeeRepository.addNewEmployee(newEmployee);
        return false;
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findByIdEmployee(id);
    }

    @Override
    public void updateEmployee(Employee employee) {
         employeeRepository.updateEmployee(employee);
    }

    @Override
    public void deleteEmployee(int id) {
       employeeRepository.deleteEmployee(id);
    }

    @Override
    public List<Employee> search(String nameE, String addresE, String phoneE) {
        return employeeRepository.search(nameE,addresE,phoneE);
    }
}
