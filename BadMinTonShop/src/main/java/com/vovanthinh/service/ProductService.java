package com.vovanthinh.service;

import java.util.List;
import com.vovanthinh.model.Product;

public interface ProductService {
    void insert(Product p);
    void update(Product p);
    void delete(int id);
    Product get(int id);
    List<Product> getAll();
    List<Product> search(String keyword);
    List<Product> getTop10Newest();
    List<Product> getPaging(int page, int pageSize);
    long countTotalProducts();
}
