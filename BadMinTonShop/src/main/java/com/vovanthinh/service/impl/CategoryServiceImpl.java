package com.vovanthinh.service.impl;

import java.util.List;

import com.vovanthinh.dao.CategoryDAO;
import com.vovanthinh.dao.impl.CategoryDAOImpl;
import com.vovanthinh.model.Category;
import com.vovanthinh.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {

    private final CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    public List<Category> getAll() {
        return categoryDAO.getAll();
    }

    @Override
    public Category get(int id) {
        return categoryDAO.get(id);
    }

    @Override
    public void insert(Category category) {
        categoryDAO.insert(category);
    }

    @Override
    public void update(Category category) {
        categoryDAO.update(category);
    }

    @Override
    public void delete(int id) {
        categoryDAO.delete(id);
    }
}
