package project.demo.service.impl;

import project.demo.model.Cart;
import project.demo.service.CartService;
import project.demo.dao.GenericDao;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

@Service
public class CartServiceImpl extends GenericServiceImpl<Cart, Integer> implements CartService {

    @Override
    @Autowired
    void setGenericDao(GenericDao<Cart, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}