package project.demo.service.impl;

import project.demo.model.Category;
import project.demo.service.CategoryService;
import project.demo.dao.GenericDao;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

@Service
public class CategoryServiceImpl extends GenericServiceImpl<Category, Integer> implements CategoryService {

    @Override
    @Autowired
    void setGenericDao(GenericDao<Category, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}