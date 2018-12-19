<%@ include file = "../../config/importer/Importer.jsp" %>
<%@ include file = "../../app/http/Middleware/RedirectIfNotAdmin.jsp" %>
<%@ include file = "../../app/http/Controller/TransactionController.jsp" %>

<%
    TransactionController transactionController = new TransactionController(auth);
    UserController userController = new UserController();

    ArrayList<Transaction> transactions = transactionController.getTransactions();
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> Travel Portal </title>

    <!-- Stylesheets -->
    <link rel="stylesheet" href="../../public/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../public/css/styles.css">
    <link rel="stylesheet" href="../../public/css/web-template.css">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans:400,500" rel="stylesheet">
</head>
<body id="root">
    <%@ include file = "./commons/components/templates/header-apps.jsp" %>
        <section class="banner">
            <div class="container">
                <div class="banner-content d-flex flex-column align-items-start">
                    <h2 class="banner-title mb-4">
                        Transactions
                    </h2>
                    <span class="banner-description">
                        On Progress Transaction
                    </span>
                </div>
            </div>
        </section>
    </header>

    <div id="main">
        <section class="container">
            <div>
                <div class="box banner-box" style="padding: 50px 75px">
                    <div>
                        <div class="box-form">
                            <table class="table table-hover table-light">
                                <thead>
                                <tr>
                                    <th> Invoice Number </th>
                                    <th> Date </th>
                                    <th> Buyer </th>
                                    <th> Status </th>
                                    <th style="width: 25%"> Action </th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (Transaction t : transactions) {
                                        String requiredParam = "id=" + t.id + "&invoice_number=" + t.invoiceNumber;
                                %>
                                        <tr>
                                            <td> <%= t.invoiceNumber %> </td>
                                            <td> <%= t.date %> </td>
                                            <td> <%= userController.getUserById(t.buyer + "").name %> </td>
                                            <td>
                                                <%
                                                    if (t.status.equalsIgnoreCase("Approved")) {
                                                %>
                                                        <span class="badge badge-success"> Approved </span>
                                                <%
                                                    } else if (t.status.equalsIgnoreCase("Rejected")) {
                                                %>
                                                        <span class="badge badge-danger"> Rejected </span>
                                                <%
                                                    } else if (t.status.equalsIgnoreCase("Canceled")) {
                                                %>
                                                        <span class="badge badge-danger"> Canceled </span>
                                                <%
                                                    } else if (t.status.equalsIgnoreCase("Pending")) {
                                                %>
                                                        <span class="badge badge-warning"> Pending </span>
                                                <%
                                                    } else {
                                                %>
                                                        <span class="badge badge-secondary"> No Status </span>
                                                <%
                                                    }
                                                %>
                                            </td>
                                            <td>
                                                <a href="transaction-detail.jsp?<%= requiredParam %>" class="btn btn-info btn-sm"> View </a>
                                                <%
                                                    if (t.status.equalsIgnoreCase("Approved") || t.status.equalsIgnoreCase("Canceled")) {
                                                %>
                                                        <a href="transaction-update.jsp?<%= requiredParam %>" class="btn btn-primary btn-sm disabled"> Edit </a>
                                                        <a href="../../app/http/Handler/TransactionCancelation.jsp?<%= requiredParam %>" class="btn btn-danger btn-sm disabled"> Delete </a>
                                                <%
                                                    } else {
                                                %>
                                                        <a href="transaction-update.jsp?<%= requiredParam %>" class="btn btn-primary btn-sm"> Edit </a>
                                                        <a href="../../app/http/Handler/TransactionCancelation.jsp?<%= requiredParam %>" class="btn btn-danger btn-sm"> Delete </a>
                                                <%
                                                    }
                                                %>
                                            </td>
                                        </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <%@ include file = "./commons/components/templates/footer.jsp" %>

    <script src="../../public/js/bootstrap.min.js"></script>
</body>
</html>