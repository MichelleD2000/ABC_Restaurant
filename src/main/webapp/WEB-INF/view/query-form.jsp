<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css">
    <style>
        body {
            background-color: #000; /* Black background */
            color: #fff; /* White text color */
            padding: 20px;
        }
        h2 {
            color: #D4AF37; /* Gold color for heading */
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            color: #D4AF37; /* Gold color for labels */
        }
        .form-control, .form-select, textarea {
            background-color: #333; /* Dark grey background for form elements */
            color: #fff; /* White text color */
            border: 1px solid #D4AF37; /* Gold border */
        }
        .form-control:focus, .form-select:focus {
            border-color: #b09f3f; /* Slightly darker gold for focus */
            box-shadow: 0 0 0 0.2rem rgba(255, 193, 7, 0.25); /* Subtle gold shadow */
        }
        button[type="submit"] {
            background-color: #D4AF37; /* Gold color for submit button */
            border: none;
            color: #000; /* Black text color */
            padding: 10px 20px;
            font-size: 16px;
        }
        button[type="submit"]:hover {
            background-color: #b09f3f; /* Slightly darker gold for hover */
        }
        a {
            color: #D4AF37; /* Gold color for links */
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>${query.id == null ? 'New Query' : 'Edit Query'}</h2>

    <form action="queries?action=${query.id == null ? 'insert' : 'update'}" method="post">
        <c:if test="${query.id != null}">
            <input type="hidden" name="id" value="${query.id}">
        </c:if>
        <div class="form-group">
            <label for="customerName">Customer Name:</label>
            <input type="text" name="customerName" id="customerName" id="customerName" class="form-control" value="${query.customerName}">
        </div>
        <div class="form-group">
            <label for="customerEmail">Customer Email:</label>
            <input type="email" name="customerEmail" id="customerEmail" id="customerEmail" class="form-control" value="${query.customerEmail}">
        </div>
        <div class="form-group">
            <label for="queryText">Query:</label>
            <textarea name="queryText" id="queryText" id="queryText" class="form-control">${query.queryText}</textarea>
        </div>
        <c:if test="${query.id != null}">
            
            <div class="form-group">
                <label for="status">Status:</label>
                <select name="status" id="status" class="form-select">
                    <option value="Pending" ${query.status == 'Pending' ? 'selected' : ''}>Pending</option>
                    <option value="Resolved" ${query.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
                </select>
            </div>
        </c:if>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Save</button>
        </div>
    </form>
    <a href="queries?action=list">Back to Queries List</a>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
