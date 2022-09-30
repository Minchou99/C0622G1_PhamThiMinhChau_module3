package service.impl;

import model.Product;
import service.IProductService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {
    private static Map<Integer, Product> products;
    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "John", 100000,"Beauty","Minh Châu"));
        products.put(2, new Product(2, "Bill",20000,"Nice","MinChouuu"));
        products.put(3, new Product(3, "Alex", 20000,"Beauty","MinChouuu"));
        products.put(4, new Product(4, "Adam", 20000,"Nice","Minh Châu"));
        products.put(5, new Product(5, "Sophia", 20000,"Beauty","MinChouuu"));
        products.put(6, new Product(6, "Rose", 20000,"Nice","Minh Châu"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
