package project.demo.dao.impl;

import project.demo.model.Category;
import project.demo.dao.CategoryDao;

import org.springframework.stereotype.Repository;

@Repository
public class CategoryDaoImpl extends GenericDaoImpl<Category, Integer> implements CategoryDao {
}