package com.vovanthinh.service.impl;

import java.util.List;

import com.vovanthinh.dao.ProductDAO;
import com.vovanthinh.dao.impl.ProductDAOImpl;
import com.vovanthinh.model.Product;
import com.vovanthinh.service.ProductService;

public class ProductServiceImpl implements ProductService {

    private final ProductDAO productDAO = new ProductDAOImpl();

    @Override
    public void insert(Product product) {
        productDAO.insert(product);
    }

    @Override
    public void update(Product product) {
        productDAO.update(product);
    }

    @Override
    public void delete(int id) {
        productDAO.delete(id);
    }

    @Override
    public Product get(int id) {
        return productDAO.get(id);
    }

    @Override
    public List<Product> getAll() {
        return productDAO.getAll();
    }

    @Override
    public List<Product> search(String keyword) {
        return productDAO.search(keyword);
    }

    @Override
    public List<Product> getTop10Newest() {
        return productDAO.findTop10Newest();
    }

    @Override
    public List<Product> getPaging(int page, int size) {
        return productDAO.findPaging(page, size);
    }

    @Override
    public long countTotalProducts() {
        return productDAO.countTotalProducts();
    }
}
