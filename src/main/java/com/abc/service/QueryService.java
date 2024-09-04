package com.abc.service;

import com.abc.dao.QueryDAO;
import com.abc.model.Query;

import java.sql.SQLException;
import java.util.List;

public class QueryService {
    private static QueryService instance;
    private QueryDAO queryDAO;

    private QueryService() throws SQLException {
        queryDAO = QueryDAO.getInstance();
    }

    public static QueryService getInstance() throws SQLException {
        if (instance == null) {
            instance = new QueryService();
        }
        return instance;
    }

    public void createQuery(Query query) throws SQLException {
        queryDAO.createQuery(query);
    }

    public List<Query> getAllQueries() throws SQLException {
        return queryDAO.getAllQueries();
    }

    public Query getQueryById(int id) throws SQLException {
        return queryDAO.getQueryById(id);
    }

    public void updateQuery(Query query) throws SQLException {
        queryDAO.updateQuery(query);
    }

    public void deleteQuery(int id) throws SQLException {
        queryDAO.deleteQuery(id);
    }
}
