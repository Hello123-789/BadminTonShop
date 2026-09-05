package com.vovanthinh.service.impl;
import java.util.List;
import com.vovanthinh.dao.CategoryDAO;
import com.vovanthinh.dao.impl.CategoryDAOImpl;
import com.vovanthinh.model.Category;
import com.vovanthinh.service.CategoryService;
public class CategoryServiceImpl implements CategoryService { private final CategoryDAO dao=new CategoryDAOImpl(); public List<Category> getAll(){return dao.getAll();} public Category get(int id){return dao.get(id);} public void insert(Category c){dao.insert(c);} public void update(Category c){dao.update(c);} public void delete(int id){dao.delete(id);} }
