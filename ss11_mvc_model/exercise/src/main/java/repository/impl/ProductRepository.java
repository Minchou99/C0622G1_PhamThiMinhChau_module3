package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> products = new ArrayList<>();
    static {
        products.add( new Product(1, "John", 100000, "Beauty", "Minh Châu"));
        products.add(new Product(2, "Bill", 20000, "Nice", "MinChouuu"));
        products.add( new Product(3, "Alex", 20000, "Beauty", "MinChouuu"));
        products.add( new Product(4, "Adam", 20000, "Nice", "Minh Châu"));
        products.add( new Product(5, "Sophia", 20000, "Beauty", "MinChouuu"));
        products.add( new Product(6, "Rose", 20000, "Nice", "Minh Châu"));
        products.add( new Product(7, "John", 100000, "Beauty", "Minh Châu"));
        products.add(new Product(8, "Bill", 20000, "Nice", "MinChouuu"));
        products.add( new Product(9, "Alex", 20000, "Beauty", "MinChouuu"));
        products.add( new Product(10, "Adam", 20000, "Nice", "Minh Châu"));
        products.add( new Product(11, "Sophia", 20000, "Beauty", "MinChouuu"));
        products.add( new Product(12, "Rose", 20000, "Nice", "Minh Châu"));
        products.add( new Product(13, "John", 100000, "Beauty", "Minh Châu"));
        products.add(new Product(14, "Bill", 20000, "Nice", "MinChouuu"));
        products.add( new Product(15, "Alex", 20000, "Beauty", "MinChouuu"));
        products.add( new Product(16, "Adam", 20000, "Nice", "Minh Châu"));
        products.add( new Product(17, "Sophia", 20000, "Beauty", "MinChouuu"));
        products.add( new Product(18, "Rose", 20000, "Nice", "Minh Châu"));
        products.add( new Product(19, "John", 100000, "Beauty", "Minh Châu"));
        products.add(new Product(20, "Bill", 20000, "Nice", "MinChouuu"));
        products.add( new Product(21, "Alex", 20000, "Beauty", "MinChouuu"));
        products.add( new Product(22, "Adam", 20000, "Nice", "Minh Châu"));
        products.add( new Product(23, "Sophia", 20000, "Beauty", "MinChouuu"));
        products.add( new Product(24, "Rose", 20000, "Nice", "Minh Châu"));
    }


    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    public List<Product> findByName(String name){
        List<Product> productList = new ArrayList<>();
        for (int i = 0; i<products.size(); i++){
            if(products.get(i).getName().contains(name)){
                productList.add(products.get(i));
            }
        }
        return productList;
    }

    public List<Product> findByProducer(String producer){
        List<Product> productList = new ArrayList<>();
        for (int i = 0; i<products.size(); i++){
            if(products.get(i).getProducer().contains(producer)){
                productList.add(products.get(i));
            }
        }
        return productList;
    }

    @Override
    public void save(Product product) {
    products.add(product);
    }

    @Override
    public void update(Product product) {
       products.add(product);
    }

    @Override
    public void delete(int id) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == id) {
                products.remove(i);
                break;
            }
        }
    }
}
