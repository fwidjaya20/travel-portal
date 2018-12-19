<%@ include file = "../../config/importer/Importer.jsp" %>
<%@ include file = "../../app/http/Middleware/RedirectIfNotAdmin.jsp" %>
<%@ include file = "../../app/http/Controller/CityController.jsp" %>
<%@ include file = "../../app/http/Controller/TransactionController.jsp" %>

<%
    CityController cityController = new CityController();
    TransactionController transactionController = new TransactionController(auth);

    ArrayList<Cart> carts = transactionController.getLoggedUserCart();
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

    <style type="text/css">
        .banner {
            position: relative;
            background-color: var(--primary-color);
            color: #fff !important;
            min-height: 0 !important;
        }

        .banner .banner-content {
            min-height: 0 !important;
            padding-bottom: 0 !important;
            padding: 60px 0 !important;
        }
    </style>
</head>
<body id="root">
    <%@ include file = "./commons/components/templates/header-apps.jsp" %>
        <section class="banner">
            <div class="container">
                <div class="banner-content d-flex flex-column align-items-start">
                    <h2 class="banner-title mb-4">
                        Purchase Confirmation
                    </h2>
                    <span class="banner-description">
                        Confirm your tickets.
                    </span>
                </div>
            </div>
        </section>
    </header>

    <div id="main">
        <section class="container">
            <%
                if (carts.size() < 1) {
            %>
                    <div> 
                        <div class="row mt-5 text-muted">
                            Cart is Empty! Please order first.
                        </div>
                    </div>
            <%
                } else {
            %>
                    <div>
                        <div class="row mt-5">
                            <div class="col-12 col-md-9">
                                <%
                                    int i = 1;
                                    for (Cart c : carts) {
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
                                                                    <div class="ml-1"> <%= c.personInformation.title + ". " + c.personInformation.name %> </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-6">
                                                                <div class="form-group">
                                                                    <span class="badge text-left p-0">Nasionality</span>
                                                                    <div class="ml-1"> <%= c.personInformation.nasionality %> </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-3">
                                                            <div class="col-6">
                                                                <div class="form-group">
                                                                    <span class="badge text-left p-0">Departure</span>
                                                                    <div class="ml-1"> <%= cityController.getCityById(c.ticket.from_city + "").city %> </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-6">
                                                                <div class="form-group">
                                                                    <span class="badge text-left p-0">Arrival</span>
                                                                    <div class="ml-1"> <%= cityController.getCityById(c.ticket.to_city + "").city %> </div>
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
                            <div class="col-12 col-md-3">
                                <h4 class="mt-4"> Buyer Information </h4>

                                <div class="mt-3">
                                    <div class="form-group">
                                        <span class="badge text-left p-0">Name</span>
                                        <div class="ml-1"> <%= carts.get(0).buyer.name %> </div>
                                    </div>
                                </div>

                                <h4 class="mt-4"> Total Price(s) </h4>

                                <div class="mt-1">
                                    <div class="form-group">
                                        <div class="ml-1">
                                            <%
                                                int prices = 0;

                                                for (Cart c : carts) {
                                                    if (c.cabinType.equalsIgnoreCase("Business")) {
                                                        prices += c.ticket.price_business;
                                                    } else if (c.cabinType.equalsIgnoreCase("Economy")) {
                                                        prices += c.ticket.price_economy;
                                                    } else {
                                                        prices += 0;
                                                    }
                                                }
                                            %>
                                            <span class="badge">Rp.</span> <%= prices %>
                                        </div>
                                    </div>
                                </div>

                                <div class="mt-4">
                                    <form action="../../app/http/Handler/TransactionPurchase.jsp" method="post">
                                        <button type="submit" class="btn btn-portal-primary btn-block">
                                            Pay
                                        </button>

                                        <a href="../../app/http/Handler/CartCancelation.jsp" class="btn btn-danger btn-block"> Cancel </a>
                                        
                                        <span class="error text-danger">
                                            <%= request.getParameter("errorMsg") != null ? request.getParameter("errorMsg") : "" %>
                                        </span>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
            <%
                }
            %>
        </section>
    </div>

    <%@ include file = "./commons/components/templates/footer.jsp" %>

    <script src="../../public/js/bootstrap.min.js"></script>
</body>
</html>