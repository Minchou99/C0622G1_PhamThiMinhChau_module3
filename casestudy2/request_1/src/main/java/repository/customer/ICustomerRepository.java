package repository.customer;

import model.person.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> showListCustomer();

    boolean addNewCustomer(Customer customer);

    void deleteCustomer(int id);

    void updateCustomer(Customer customer);

    Customer findById(int id);

    List<Customer> searchByName(String name);
}
