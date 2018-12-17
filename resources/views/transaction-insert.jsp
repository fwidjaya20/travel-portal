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
                        Transaction Details
                    </h2>
                    <span class="banner-description">
                        Detail of selected transaction
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
                            <div class="row">
                                <form class="col-md-6 col-sm-12">
                                    <div class="row">
                                        <div class="table-responsive col-12">
                                            <table class="table table-hover">
                                                <thead>
                                                <tr>
                                                    <th>Person Title</th>
                                                    <th>Person Name</th>
                                                    <th>Person Nasionality</th>
                                                    <th>Ticket</th>
                                                    <th> Action </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>@mbo</td>
                                                    <td>@mbo</td>
                                                    <td>@mbo</td>
                                                    <td>@mbo</td>
                                                    <td>
                                                        <a href="javascript:;" class="btn btn-danger btn-sm"> Delete </a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12 text-right">
                                            <button class="btn btn-portal-primary">
                                                Checkout
                                            </button>
                                        </div>
                                    </div>
                                </form>

                                <form class="col-md-6 col-sm-12">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="from">From</label>
                                                <select id="from" class="form-control">
                                                    <option value="-"> - </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="to">To</label>
                                                <select id="to" class="form-control">
                                                    <option value="-"> - </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="depature">Depature Date</label>
                                                <input type="date" id="depature" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="row">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="passengers">Passengers</label>
                                                        <select id="passengers" class="form-control">
                                                            <option value="1"> 1 </option>
                                                            <option value="2"> 2 </option>
                                                            <option value="3"> 3 </option>
                                                            <option value="4"> 4 </option>
                                                            <option value="5"> 5 </option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label for="class">Cabin Class</label>
                                                        <select id="class" class="form-control">
                                                            <option value="economy"> Economy </option>
                                                            <option value="business"> Business </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12 text-right">
                                            <a href="ticket-search.jsp" class="btn btn-portal-primary text-light">
                                                Search Flight
                                            </a>
                                        </div>
                                    </div>
                                </form>
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