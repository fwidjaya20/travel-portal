<%@ include file = "../../config/importer/Importer.jsp" %>
<%@ include file = "../../app/http/Middleware/RedirectIfNotAdmin.jsp" %>
<%@ include file = "../../app/http/Controller/CityController.jsp" %>

<%
    CityController controller = new CityController();
    ArrayList<City> cities = controller.getCities();
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
                        Insert Ticket
                    </h2>
                    <span class="banner-description">
                        Insert new ticket for airlines
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
                        <form action="../../app/http/Handler/TicketInsert.jsp" method="post" class="box-form">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="airline">Airline</label>
                                        <select id="airline" name="airline" class="form-control">
                                            <option value="Sriwijaya Air"> Sriwijaya Air </option>
                                            <option value="Garuda Indonesia"> Garuda Indonesia </option>
                                            <option value="Lion Air"> Lion Air </option>
                                            <option value="Batik Air"> Batik Air </option>
                                            <option value="City Link"> City Link </option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label for="from">From</label>
                                        <select id="from" name="from" class="form-control">
                                            <%
                                                for(City c : cities) {
                                            %>
                                                    <option value="<%= c.id %>"> <%= c.city %> </option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label for="to">To</label>
                                        <select id="to" name="to" class="form-control">
                                            <%
                                                for(City c : cities) {
                                            %>
                                                    <option value="<%= c.id %>"> <%= c.city %> </option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-2">
                                <div class="col-md-6 col-sm-12">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="price_economy">Price Economy (Rp.)</label>
                                                <input type="number" id="price_economy" name="price_economy" class="form-control" value="0">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="price_business">Price Business (Rp.)</label>
                                                <input type="number" id="price_business" name="price_business" class="form-control" value="0">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <%
                                                    Date d = new Date();

                                                    String format = "Y-M-d";
        
                                                    DateFormat dateFormat = new SimpleDateFormat(format);
                                                %>
                                                <label for="depature_date">Depature Date</label>
                                                <input type="date" id="depature_date" name="depature_date" class="form-control" value="<%= dateFormat.format(d) %>" min="<%= dateFormat.format(d) %>">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="available_seat">Available Seat</label>
                                                <input type="number" id="available_seat" name="available_seat" class="form-control" value="0">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 text-right">
                                    <span class="error text-danger">
                                        <%= request.getParameter("errorMsg") != null ? request.getParameter("errorMsg") : "" %>
                                    </span>

                                    <button class="btn btn-portal-primary">
                                        Insert Ticket
                                    </button>
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