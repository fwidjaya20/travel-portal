<%@ include file = "../../config/importer/Importer.jsp" %>
<%@ include file = "../../app/http/Middleware/RedirectIfNotAdmin.jsp" %>
<%@ include file = "../../app/http/Controller/CityController.jsp" %>
<%@ include file = "../../app/http/Controller/TransactionController.jsp" %>

<%
    CityController cityController = new CityController();
    TransactionController transactionController = new TransactionController(auth);

    String invoiceNumber = request.getParameter("invoice_number");

    String invoiceStatus = transactionController.getOrderStatusByInvoiceNumber(invoiceNumber);

    ArrayList<TransactionDetail> transactions = transactionController.trackOrderByInvoiceNumber(invoiceNumber);
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
                        Track your Order
                    </h2>
                    <span class="banner-description">
                        We provide your order information here
                    </span>
                </div>
            </div>
        </section>
    </header>

    <div id="main">
        <section class="container">
            <div class="row">
                <div class="box banner-box col-12 col-lg-9" style="padding: 20px 65px">
                    <div style="position: absolute;top: 0;left:15px;margin-top: -15px;">
                        <span class="badge badge-secondary"><%= invoiceNumber %></span>
                        <%
                            if (invoiceStatus.equals("Approved")) {
                        %>
                                <span class="badge badge-success">
                        <%
                            } else if (invoiceStatus.equals("Rejected")) {
                        %>
                                <span class="badge badge-danger">
                        <%
                            } else if (invoiceStatus.equals("Canceled")) {
                        %>
                                <span class="badge badge-danger">
                        <%
                            } else if (invoiceStatus.equals("Pending")) {
                        %>
                                <span class="badge badge-warning">
                        <%
                            }
                        %>
                                    <%= invoiceStatus %>
                                </span>
                    </div>

                    <div>
                        <div class="box-form">
                            <%
                                if (transactions.size() < 1) {
                            %>
                                    <div> 
                                        <div class="row text-muted">
                                            No transaction with labeled <%= invoiceNumber %>
                                        </div>
                                    </div>
                            <%
                                } else {
                            %>
                                    <div>
                                        <div class="row">
                                            <div class="col-12">
                                                <%
                                                    int i = 1;
                                                    for (TransactionDetail c : transactions) {
                                                %>
                                                        <div class="pt-4">
                                                            <div class="ticket-card">
                                                                <div>
                                                                    <div class="box-form" style="padding: 30px 0;">
                                                                        <p class="d-flex align-items-center mb-5">
                                                                            <span class="circle-badge mr-2"> <%= i %> </span> Passenger Information
                                                                        </p>
                                                                        <div class="row">
                                                                            <div class="col-6">
                                                                                <div class="form-group">
                                                                                    <span class="badge text-left p-0">Name</span>
                                                                                    <div class="ml-1"> <%= c.personalInformation.title + ". " + c.personalInformation.name %> </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-6">
                                                                                <div class="form-group">
                                                                                    <span class="badge text-left p-0">Nasionality</span>
                                                                                    <div class="ml-1"> <%= c.personalInformation.nasionality %> </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                <%
                                                    i++;
                                                    }
                                                %>
                                            </div>
                                        </div>
                                    </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-3">
                    <div>
                        <h4 class="mt-4"> Ticket Status </h4>

                        <div class="mt-3">
                            <div class="form-group">
                                <div class="ml-1">
                                    <%
                                        if (invoiceStatus.equals("Approved")) {
                                    %>
                                            <span class="btn btn-outline-success">
                                    <%
                                        } else if (invoiceStatus.equals("Rejected")) {
                                    %>
                                            <span class="btn btn-outline-danger">
                                    <%
                                        } else if (invoiceStatus.equals("Canceled")) {
                                    %>
                                            <span class="btn btn-outline-danger">
                                    <%
                                        } else if (invoiceStatus.equals("Pending")) {
                                    %>
                                            <span class="btn btn-outline-warning">
                                    <%
                                        }
                                    %>
                                                <%= invoiceStatus %>
                                            </span>
                                </div>
                            </div>
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