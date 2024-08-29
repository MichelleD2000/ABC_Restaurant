package com.abc.service;

import com.abc.dao.QueryDAO;
import com.abc.model.Query;
import java.sql.SQLException;
import java.util.List;

public class QueryService {
    private static QueryService instance;
    private QueryDAO queryDAO;

    private QueryService() {
        queryDAO = QueryDAO.getInstance();
    }

    public static QueryService getInstance() {
        if (instance == null) {
            instance = new QueryService();
        }
        return instance;
    }

    public void saveQuery(Query query) throws SQLException {
        queryDAO.saveQuery(query);
    }

    public List<Query> getAllQueries() throws SQLException {
        return queryDAO.getAllQueries();
    }

    public void respondToQuery(int queryId, String response) throws SQLException {
        queryDAO.updateResponse(queryId, response);
    }
}
