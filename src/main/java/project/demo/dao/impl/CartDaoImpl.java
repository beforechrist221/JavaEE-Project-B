package project.demo.dao.impl;

import project.demo.model.Cart;
import project.demo.dao.CartDao;

import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl extends GenericDaoImpl<Cart, Integer> implements CartDao {
}