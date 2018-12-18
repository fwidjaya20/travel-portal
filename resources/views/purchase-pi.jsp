<%@ include file = "../../config/importer/Importer.jsp" %>

<%
    String flight_id = request.getParameter("flight_id");
    String passenger = request.getParameter("passengers");
    String cabin_class = request.getParameter("cabin_class");

    String requiredParam = "flight_id=" + flight_id + "&passengers=" + passenger + "&cabin_class=" + cabin_class;
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
            <div class="pt-4">
                <div class="ticket-card">
                    <div>
                        <form action="../../app/http/Handler/TransactionPurchase.jsp?<%= requiredParam %>" method="post" class="box-form">
                            <%
                                for (int i = 1 ; i <= Integer.parseInt(passenger) ; i++) {
                            %>
                                    <p class="d-flex align-items-center">
                                        <span class="circle-badge mr-2"> <%= i %> </span> Passenger Information
                                    </p>
                                    <div class="row">
                                        <div class="col-md-4 col-sm-12">
                                            <div class="form-group">
                                                <label for="person_title">Title</label>
                                                <select id="person_title" name="person_title_<%= i %>" class="form-control">
                                                    <option value="Mr"> Mr </option>
                                                    <option value="Mrs"> Mrs </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-12">
                                            <div class="form-group">
                                                <label for="person_name">Name</label>
                                                <input type="text" id="person_name" name="person_name_<%= i %>" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-12">
                                            <div class="form-group">
                                                <label for="person_nasionality">Nasionality</label>
                                                <select id="person_nasionality" name="person_nasionality_<%= i %>" class="form-control">
                                                    <option value="Indonesia"> Indonesia </option>
                                                    <option value="China"> China </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                            <%
                                }
                            %>

                            <div class="row">
                                <div class="col-12 text-right">
                                    <span class="error text-danger">
                                        <%= request.getParameter("errorMsg") != null ? request.getParameter("errorMsg") : "" %>
                                    </span>
                                    
                                    <button type="submit" class="btn btn-portal-primary">
                                        Purchase Ticket(s)
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