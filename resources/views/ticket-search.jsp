<%@ include file = "../../config/importer/Importer.jsp" %>
<%@ include file = "../../app/http/Controller/TicketController.jsp" %>
<%@ include file = "../../app/http/Controller/CityController.jsp" %>

<%
    CityController cityController = new CityController();
    TicketController ticketController = new TicketController();

    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String depature_date = request.getParameter("depature_date");
    String passenger = request.getParameter("passengers");
    String cabin_class = request.getParameter("cabin_class");

    ArrayList<Ticket> tickets = ticketController.filterTicket(from, to, depature_date, passenger);

    String requiredParam = "passengers=" + passenger + "&cabin_class=" + cabin_class;
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
    </header>

    <div id="main">
        <section class="container">
            <%
                if (tickets.size() < 1) {
            %>
                    <div class="pt-4">
                        <div class="ticket-card text-center text-muted">
                            No Tickets Found!
                        </div>
                    </div>        
            <%
                } else {
                    for (Ticket t : tickets) {
            %>
                        <div class="pt-4">
                            <div class="ticket-card">
                                <form class="row card-item">
                                    <div class="col-md-2 form-group">
                                        <label> Airline </label>
                                        <div> <%= t.airline %> </div>
                                    </div>
                                    <div class="flex-grow-1 form-group">
                                        <label> From </label>
                                        <div> <span class="badge badge-info"><%= cityController.getCityById(t.from_city + "").city %></span> </div>
                                    </div>
                                    <div class="flex-grow-1 form-group">
                                        <label> To </label>
                                        <div> <span class="badge badge-warning"><%= cityController.getCityById(t.to_city + "").city %></span> </div>
                                    </div>
                                    <div class="flex-grow-1 form-group">
                                        <label> Price </label>
                                        <%
                                            if (cabin_class.equals("Economy")) {
                                        %>
                                                <div><sup class="badge"> Rp. </sup> &nbsp; <span><%= t.price_economy %></span></div>
                                        <%
                                            } else {
                                        %>
                                                <div><sup class="badge"> Rp. </sup> &nbsp; <span><%= t.price_business %></span></div>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div>
                                        <a href="purchase-pi.jsp?flight_id=<%= t.id %>&<%= requiredParam %>" class="btn btn-portal-primary btn-sm text-light"> &plus; </a>
                                    </div>
                                </form>
                            </div>
                        </div>
            <%
                    }
                }
            %>
        </section>
    </div>

    <%@ include file = "./commons/components/templates/footer.jsp" %>

    <script src="../../public/js/bootstrap.min.js"></script>
</body>
</html>