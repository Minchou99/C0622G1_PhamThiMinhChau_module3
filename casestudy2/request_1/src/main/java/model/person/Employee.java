package model.person;

public class Employee extends Person{
    private String educationDegree;
    private String position;
    private String devision;
    private double salary;

    public Employee() {
    }

    public Employee(String educationDegree, String position, String devision, double salary) {
        this.educationDegree = educationDegree;
        this.position = position;
        this.devision = devision;
        this.salary = salary;
    }

    public String getEducationDegree() {
        return educationDegree;
    }

    public void setEducationDegree(String educationDegree) {
        this.educationDegree = educationDegree;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDevision() {
        return devision;
    }

    public void setDevision(String devision) {
        this.devision = devision;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }
}
