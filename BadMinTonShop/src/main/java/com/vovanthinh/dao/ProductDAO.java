package com.vovanthinh.dao;

import java.util.List;
import com.vovanthinh.model.Product;

public interface ProductDAO {
    void insert(Product p);
    void update(Product p);
    void delete(int id);
    Product get(int id);
    List<Product> getAll();
    List<Product> search(String keyword);
    List<Product> findTop10Newest();
    List<Product> findPaging(int page, int pageSize);
    long countTotalProducts();
}
