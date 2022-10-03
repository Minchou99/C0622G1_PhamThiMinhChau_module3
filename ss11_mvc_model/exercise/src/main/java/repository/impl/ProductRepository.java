package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository {
    private static List<Product> products = new ArrayList<>();
    static {
        products.add( new Product(1, "John", 100000, "Beauty", "Minh Châu"));
        products.add(new Product(2, "Bill", 20000, "Nice", "MinChouuu"));
        products.add( new Product(3, "Alex", 20000, "Beauty", "MinChouuu"));
        products.add( new Product(4, "Adam", 20000, "Nice", "Minh Châu"));
        products.add( new Product(5, "Sophia", 20000, "Beauty", "MinChouuu"));
        products.add( new Product(6, "Rose", 20000, "Nice", "Minh Châu"));
    }

    

}
