package project.demo.dao;

import java.io.Serializable;
import java.util.List;

public interface GenericDao<T extends Serializable, ID extends Number> {

    void create(T t);

    List<T> queryAll();

    T queryById(ID id);

    void modify(T t);

    void remove(ID id);

    void create(String sqlId, Object parameter);

    T queryOne(String sqlId, Object parameter);

    void modify(String sqlId, Object parameter);
}
