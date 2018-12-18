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
                        Update User
                    </h2>
                    <span class="banner-description">
                        Update active user
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
                        <%
                            UserController controller = new UserController();

                            User c = controller.getUserById(request.getParameter("id"));
                        %>
                        <form action="../../app/http/Handler/UserUpdate.jsp" method="post" class="box-form">
                            <input type="hidden" name="id" value="<%= c.id %>">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input type="text" id="name" name="name" value="<%= c.name %>" class="form-control">
                                    </div>
                                </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="text" id="email" name="email" value="<%= c.email %>" class="form-control">
                                        </div>
                                    </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label class="form-check-label">Gender</label>
                                        <div class="form-check-inline">
                                            <% if (c.gender.equals("Male")) { %>
                                                <input type="radio" name="gender" id="male" value="Male" checked> &nbsp; <label for="male" class="form-check-label"> Male </label>
                                                <input type="radio" name="gender" id="female" value="Female" class="ml-3"> &nbsp; <label for="female" class="form-check-label"> Female </label>
                                            <% } else { %>
                                                <input type="radio" name="gender" id="male" value="Male"> &nbsp; <label for="male" class="form-check-label"> Male </label>
                                                <input type="radio" name="gender" id="female" value="Female" class="ml-3" checked> &nbsp; <label for="female" class="form-check-label"> Female </label>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" id="password" name="password" value="<%= c.password %>" class="form-control">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 text-right">
                                    <span class="error text-danger">
                                        <%= request.getParameter("errorMsg") != null ? request.getParameter("errorMsg") : "" %>
                                    </span>

                                    <button class="btn btn-portal-primary">
                                        Update User
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