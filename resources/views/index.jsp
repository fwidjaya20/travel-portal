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
    <link rel="stylesheet" href="../../public/css/apps-template.css">
    <link rel="stylesheet" href="../../public/css/index.css">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans:400,500" rel="stylesheet">
</head>
<body id="root">
    <%@ include file = "./commons/components/templates/header-web.jsp" %>
        <section class="banner">
            <div class="container">
                <div class="banner-content d-flex flex-column align-items-center">
                    <h2 class="index-banner-title mb-4">
                        Where are you going ?
                    </h2>

                    <span class="index-brand-motto">
                        Ticket anywhere only at TravelPortal.
                    </span>
                    <span class="index-brand-description mt-1">
                        Booking is faster, easier and cheaper.
                    </span>
                </div>
            </div>
        </section>
    </header>

    <div id="main">
        <section class="container">
            <div>
                <div class="box banner-box" style="padding: 50px 75px">
                    <div class="d-flex justify-content-between align-items-center">
                        <h3> Where are you going ? </h3>

                        <ul class="travel-portal-services">
                            <li class="service-item">
                                <button class="btn btn-service active">
                                    <img src="../../public/assets/icons/service-plane.svg" alt="">
                                </button>
                            </li>
                        </ul>
                    </div>
                    <div class="mt-5">
                        <form class="box-form">
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
                                    <a href="ticket-search.html" class="btn btn-portal-primary text-light">
                                        Search Flight
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