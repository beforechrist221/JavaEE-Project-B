package project.demo.service.impl;

import project.demo.model.Address;
import project.demo.service.AddressService;
import project.demo.dao.GenericDao;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

@Service
public class AddressServiceImpl extends GenericServiceImpl<Address, Integer> implements AddressService {

    @Override
    @Autowired
    void setGenericDao(GenericDao<Address, Integer> genericDao) {
        super.genericDao = genericDao;
    }
}