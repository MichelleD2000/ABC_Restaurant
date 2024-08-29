<!DOCTYPE html>
<html>
<head>
    <title>Staff Queries</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Customer Queries</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer Name</th>
                    <th>Customer Email</th>
                    <th>Question</th>
                    <th>Response</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="query" items="${queries}">
                    <tr>
                        <td>${query.id}</td>
                        <td>${query.customerName}</td>
                        <td>${query.customerEmail}</td>
                        <td>${query.question}</td>
                        <td>${query.response}</td>
                        <td>
                            <form action="respond" method="post">
                                <div class="form-group">
                                    <textarea class="form-control" name="response" placeholder="Enter your response"></textarea>
                                </div>
                                <input type="hidden" name="queryId" value="${query.id}">
                                <button type="submit" class="btn btn-primary">Respond</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
    </div>
</body>
</html>
