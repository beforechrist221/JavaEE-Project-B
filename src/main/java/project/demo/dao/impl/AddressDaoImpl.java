package project.demo.dao.impl;

import project.demo.model.Address;
import project.demo.dao.AddressDao;

import org.springframework.stereotype.Repository;

@Repository
public class AddressDaoImpl extends GenericDaoImpl<Address, Integer> implements AddressDao {
}