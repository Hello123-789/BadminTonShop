package com.vovanthinh.service.impl;

import java.util.List;
import com.vovanthinh.dao.ProductDAO;
import com.vovanthinh.dao.impl.ProductDAOImpl;
import com.vovanthinh.model.Product;
import com.vovanthinh.service.ProductService;

public class ProductServiceImpl implements ProductService {
    private final ProductDAO dao = new ProductDAOImpl();
    public void insert(Product p){dao.insert(p);} public void update(Product p){dao.update(p);} public void delete(int id){dao.delete(id);}
    public Product get(int id){return dao.get(id);} public List<Product> getAll(){return dao.getAll();} public List<Product> search(String k){return dao.search(k);}
    public List<Product> getTop10Newest(){return dao.findTop10Newest();}
    public List<Product> getPaging(int page,int size){return dao.findPaging(page,size);}
    public long countTotalProducts(){return dao.countTotalProducts();}
}
