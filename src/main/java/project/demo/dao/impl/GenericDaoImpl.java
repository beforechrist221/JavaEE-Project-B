package project.demo.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import project.demo.dao.GenericDao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

public abstract class GenericDaoImpl<T extends Serializable, ID extends Number> implements GenericDao<T, ID> {

    private SqlSession sqlSession;
    private String namespace;

    @Autowired
    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @SuppressWarnings("unchecked")
    public GenericDaoImpl() {
        ParameterizedType parameterizedType = (ParameterizedType) getClass().getGenericSuperclass();
        Class<T> clazz = (Class<T>) parameterizedType.getActualTypeArguments()[0];
        namespace = StringUtils.uncapitalize(clazz.getSimpleName());
    }

    private String getStatement(String sqlId) {
        return namespace.concat(".").concat(sqlId);
    }

    @Override
    public void create(T t) {
        sqlSession.insert(getStatement("create"), t);
    }

    @Override
    public List<T> queryAll() {
        return sqlSession.selectList(getStatement("queryAll"));
    }

    @Override
    public List<T> queryList(String sqlId, Object parameter) {
        return sqlSession.selectList(getStatement(sqlId), parameter);
    }

    @Override
    public T queryById(ID id) {
        return sqlSession.selectOne(getStatement("queryById"), id);
    }

    @Override
    public void modify(T t) {
        sqlSession.update(getStatement("modify"), t);
    }

    @Override
    public void remove(ID id) {
        sqlSession.delete(getStatement("remove"), id);
    }

    @Override
    public void create(String sqlId, Object parameter) {
        sqlSession.insert(getStatement(sqlId), parameter);
    }

    @Override
    public T queryOne(String sqlId, Object parameter) {
        return sqlSession.selectOne(getStatement(sqlId), parameter);
    }

    @Override
    public void modify(String sqlId, Object parameter) {
        sqlSession.update(getStatement(sqlId), parameter);
    }
}
