package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    public List<Product> findAll();

    public Product findById(int id);

    public List<Product> findByName(String name);

    public List<Product> findByProducer(String producer);

    public void save(Product product);

    public void update(Product product);

    public void delete(int id);
}
