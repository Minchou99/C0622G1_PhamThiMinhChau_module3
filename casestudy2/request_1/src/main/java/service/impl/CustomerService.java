package service.impl;

import model.person.Customer;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();


    @Override
    public List<Customer> showListCustomer() {
        return customerRepository.showListCustomer();
    }
}
