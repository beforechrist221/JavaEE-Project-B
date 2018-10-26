package project.demo.service.impl;

import project.demo.model.Product;
import project.demo.service.ProductService;
import project.demo.dao.GenericDao;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

@Service
public class ProductServiceImpl extends GenericServiceImpl<Product, Integer> implements ProductService {

    @Override
    @Autowired
    void setGenericDao(GenericDao<Product, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}