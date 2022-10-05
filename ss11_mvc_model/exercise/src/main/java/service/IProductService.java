package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    List<Product> findByName(String name);

    List<Product> findByProducer(String producer);

    void update(Product product);

    void remove(int id);
}
