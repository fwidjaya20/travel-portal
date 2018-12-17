<%@ include file = "../../config/importer/Importer.jsp" %>
<%@ include file = "../../app/http/Middleware/RedirectIfNotAdmin.jsp" %>

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
                        Tickets
                    </h2>
                    <span class="banner-description">
                        Ticket lists
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
                                    <th rowspan="2"> Airline </th>
                                    <th rowspan="2"> From </th>
                                    <th rowspan="2"> To </th>
                                    <th colspan="2" class="text-center"> Price</th>
                                    <th rowspan="2"> Seat </th>
                                    <th rowspan="2" style="width: 17%"> Action </th>
                                </tr>
                                <tr>
                                    <th> Economy </th>
                                    <th> Business </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td> @mdo </td>
                                    <td> @mdo </td>
                                    <td> @mdo </td>
                                    <td> @mdo </td>
                                    <td> @mdo </td>
                                    <td> @mdo </td>
                                    <td>
                                        <a href="ticket-update.jsp" class="btn btn-primary btn-sm"> Edit </a>
                                        <a href="javascript:;" class="btn btn-danger btn-sm"> Delete </a>
                                    </td>
                                </tr>
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