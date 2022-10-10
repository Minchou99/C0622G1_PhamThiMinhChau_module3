package service.customer.impl;

import model.customer.Customer;
import repository.customer.ICustomerRepository;
import repository.customer.impl.CustomerRepository;
import service.customer.ICustomerService;
import utils.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> showListCustomer() {
        return customerRepository.showListCustomer();
    }

    @Override
    public Map<String, String> addNewCustomer(Customer customer) {
        Map<String, String> map = new HashMap<>();
        if (customer.getName().length() == 0) {
            map.put("empty_name", "Tên không  được để trống");
        } else if (!Validate.validateName(customer.getName())) {
            map.put("invalid_name", "Sai định dạng tên");
        }

        if (customer.getPhoneNumber().length() == 0) {
            map.put("empty_phone", "Số điện thoại không được để trống");
        } else if (!Validate.validatePhone(customer.getPhoneNumber())) {
            map.put("invalid_phone", "Sai định dạng số điện thoại");
        }

        if (customer.getIdCard().length() == 0) {
            map.put("empty_IdCard", "Số căn cước công dân không được để trống");
        } else if (!Validate.validateIDCard(customer.getIdCard())) {
            map.put("invalid_IdCard", "Sai định dạng của căn cước công dân");
        }

        if (customer.getEmail().length() == 0) {
            map.put("empty_email", "Email không được để trống");
        } else if (!Validate.validateEmail(customer.getEmail())) {
            map.put("invalid_email", "Sai định dạng Email");
        }

        if (customer.getDateOfBirth().length() == 0) {
            map.put("empty_birthday", "Ngày sinh không được để trống");
        }

        if (customer.getAddress().length() == 0) {
            map.put("empty_address", "Địa chỉ không được để trống");
        }

        if (map.isEmpty()) {
            if (!customerRepository.addNewCustomer(customer)){
                map.put("error","Không thể tạo mới");
            }
        }
        return map;
    }

    @Override
    public void deleteCustomer(int id) {
        customerRepository.deleteCustomer(id);
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerRepository.updateCustomer(customer);
    }

    @Override
    public Customer findById(int id) {
        return customerRepository.findById(id);
    }

    @Override
    public List<Customer> search(String nameS, String addressS, String phoneS) {
        return customerRepository.search(nameS, addressS, phoneS);
    }

}
