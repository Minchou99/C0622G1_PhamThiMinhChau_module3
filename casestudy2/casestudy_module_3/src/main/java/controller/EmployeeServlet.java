package controller;

import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import service.employee.IDivisionService;
import service.employee.IEducationDegreeService;
import service.employee.IEmployeeService;
import service.employee.IPositionService;
import service.employee.impl.DivisionService;
import service.employee.impl.EducationDegreeService;
import service.employee.impl.EmployeeService;
import service.employee.impl.PositionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employees")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();
    private IPositionService positionService = new PositionService();
    private IDivisionService divisionService = new DivisionService();
    private IEducationDegreeService educationDegreeService = new EducationDegreeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                showEmployeeList(request, response);
                break;
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("searchName");
        String address = request.getParameter("searchAddress");
        String phone = request.getParameter("searchPhone");
        List<Employee> employeeList = employeeService.search(name, address, phone);
        List<Division> divisionList = divisionService.showListDivision();
        List<Position> positionList = positionService.showListPosition();
        List<EducationDegree> educationDegreeList = educationDegreeService.showListEducationDegree();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        try {
            request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.deleteEmployee(id);
        try {
            response.sendRedirect("/employees");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Division> divisionList = divisionService.showListDivision();
        List<Position> positionList = positionService.showListPosition();
        List<EducationDegree> educationDegreeList = educationDegreeService.showListEducationDegree();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/create.jsp");
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Division> divisionList = divisionService.showListDivision();
        List<Position> positionList = positionService.showListPosition();
        List<EducationDegree> educationDegreeList = educationDegreeService.showListEducationDegree();
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.findById(id);
        RequestDispatcher requestDispatcher;
        if (employee == null) {
            requestDispatcher = request.getRequestDispatcher("error_404.jsp");
        } else {
            request.setAttribute("employee", employee);
            request.setAttribute("divisionList", divisionList);
            request.setAttribute("positionList", positionList);
            request.setAttribute("educationDegreeList", educationDegreeList);
            requestDispatcher = request.getRequestDispatcher("view/employee/update.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewEmployee(request, response);
                break;
            case "update":
                updateEmployee(request, response);
                break;
            default:
                showEmployeeList(request, response);
                break;
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("birthday");
        String idCard = request.getParameter("id_card");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position_id"));
        int educationDegreeId = Integer.parseInt(request.getParameter("education_degree_id"));
        int divisionId = Integer.parseInt(request.getParameter("division_id"));
        Employee newEmployee = new Employee(id, name, dateOfBirth, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId);
        employeeService.updateEmployee(newEmployee);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/update.jsp");
        request.setAttribute("mess", "Update employee's information successfully!");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("birthday");
        String idCard = request.getParameter("id_card");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        Employee newEmployee = new Employee(name, dateOfBirth, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId);
        boolean check = employeeService.addEmployee(newEmployee);
        String mess = "Add new employee successfully!";
        if (!check) {
            mess = "Can not add new employee!";
        }
        request.setAttribute("mess", mess);
        showCreateForm(request, response);
    }

    private void showEmployeeList(HttpServletRequest request, HttpServletResponse response) {
        String msg = request.getParameter("msg");
        List<Employee> employeeList = employeeService.showListEmployees();
        List<Division> divisionList = divisionService.showListDivision();
        List<Position> positionList = positionService.showListPosition();
        List<EducationDegree> educationDegreeList = educationDegreeService.showListEducationDegree();

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("msg", msg);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}