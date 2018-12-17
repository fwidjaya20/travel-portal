<%@ include file = "../../config/importer/Importer.jsp" %>

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
                    <form action="purchase-pi.html" method="get" class="row card-item">
                        <div class="col-md-2 form-group">
                            <label> Airline </label>
                            <div> Garuda Indonesia </div>
                        </div>
                        <div class="flex-grow-1 form-group">
                            <label> From </label>
                            <div> Jakarta &nbsp;<span class="badge badge-info">JKT</span> </div>
                        </div>
                        <div class="flex-grow-1 form-group">
                            <label> To </label>
                            <div> Pontianak &nbsp;<span class="badge badge-info">PNK</span> </div>
                        </div>
                        <div class="flex-grow-1 form-group">
                            <label> Price </label>
                            <div><sup class="badge"> Rp. </sup> &nbsp; <span>1.225.000</span></div>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-portal-primary btn-sm"> &plus; </button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>

    <%@ include file = "./commons/components/templates/footer.jsp" %>

    <script src="../../public/js/bootstrap.min.js"></script>
</body>
</html>