package project.demo.dao.impl;

import project.demo.model.Product;
import project.demo.dao.ProductDao;

import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl extends GenericDaoImpl<Product, Integer> implements ProductDao {
}