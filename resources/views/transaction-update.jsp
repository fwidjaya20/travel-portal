<%@ include file = "../../config/importer/Importer.jsp" %>
<%@ include file = "../../app/http/Middleware/RedirectIfNotAdmin.jsp" %>
<%@ include file = "../../app/http/Controller/TransactionController.jsp" %>

<%
    TicketController ticketController = new TicketController();
    TransactionController transactionController = new TransactionController(auth);
    
    String invoiceNumber = request.getParameter("invoice_number");

    Transaction transaction = transactionController.getTransactionByInvoiceNumber(invoiceNumber);

    String requiredParam = "id=" + transaction.id + "&invoice_number=" + transaction.invoiceNumber;
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
                        Update Transaction
                    </h2>
                    <span class="banner-description">
                        Update selected transaction
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
                        <form class="box-form">
                            <div class="row">
                                <span class="badge badge-primary"> <%= invoiceNumber %> </span>
                                <%
                                    if (transaction.status.equalsIgnoreCase("Approved")) {
                                %>
                                        <span class="badge badge-success ml-2"> Approved </span>
                                <%
                                    } else if (transaction.status.equalsIgnoreCase("Rejected")) {
                                %>
                                        <span class="badge badge-danger ml-2"> Rejected </span>
                                <%
                                    } else if (transaction.status.equalsIgnoreCase("Canceled")) {
                                %>
                                        <span class="badge badge-danger ml-2"> Canceled </span>
                                <%
                                    } else if (transaction.status.equalsIgnoreCase("Pending")) {
                                %>
                                        <span class="badge badge-warning ml-2"> Pending </span>
                                <%
                                    } else {
                                %>
                                        <span class="badge badge-secondary"> No Status </span>
                                <%
                                    }
                                %>
                            </div>
                            <div class="row mt-2">
                                <div class="table-responsive col-12">
                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>Person Title</th>
                                            <th>Person Name</th>
                                            <th>Person Nasionality</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            ArrayList<TransactionDetail> details = transactionController.getTransactionDetials(transaction.id + "");

                                            for (TransactionDetail d : details) {
                                                String requiredParam2 = "id=" + d.id + "&transaction_id=" + transaction.id;
                                        %>
                                                <tr>
                                                    <td> <%= d.personalInformation.title %> </td>
                                                    <td> <%= d.personalInformation.name %> </td>
                                                    <td> <%= d.personalInformation.nasionality %> </td>
                                                    <td>
                                                        <a href="../../app/http/Handler/TransactionDetailDeletion.jsp?<%= requiredParam2 %>" class="btn btn-danger btn-sm"> Delete </a>
                                                    </td>
                                                </tr>
                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 text-right">
                                    <a href="transaction.jsp" class="btn btn-portal-primary text-light">
                                        Back
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <%@ include file = "./commons/components/templates/footer.jsp" %>

    <script src="../../public/js/bootstrap.min.js"></script>
</body>
</html>