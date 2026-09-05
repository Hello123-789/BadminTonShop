package com.vovanthinh.service;
import java.util.List;
import com.vovanthinh.model.Category;
public interface CategoryService { List<Category> getAll(); Category get(int id); void insert(Category c); void update(Category c); void delete(int id); }
