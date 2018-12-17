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
    <link rel="stylesheet" href="../../public/css/landing-template.css">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans:400,500" rel="stylesheet">
</head>
<body id="root">
    <header class="template-header">
        <section class="banner d-flex justify-content-center align-items-center">
            <div class="container text-center">
                <h2 class="title">
                    Your Profile
                </h2>
            </div>
        </section>
    </header>

    <div id="main">
        <section class="container">
            <div>
                <div class="landing d-flex justify-content-center">
                    <div class="landing-form landing-box">
                        <form action="../../app/http/Handler/UpdateProfile.jsp" method="post" novalidate>
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" id="name" name="name" value="<%= auth.getUser().name %>" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" id="email" name="email" value="<%= auth.getUser().email %>" class="form-control" placeholder="example@travel.dev">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password" value="<%= auth.getUser().password %>" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password_c">Password Confirmation</label>
                                <input type="password" id="password_c" name="password_c" value="<%= auth.getUser().password %>" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-check-label">Gender</label>
                                <div class="form-check-inline">
                                    <% if (auth.getUser().gender.equals("Male")) { %>
                                        <input type="radio" name="gender" id="male" value="Male" checked> &nbsp; <label for="male" class="form-check-label"> Male </label>
                                        <input type="radio" name="gender" id="female" value="Female" class="ml-3"> &nbsp; <label for="female" class="form-check-label"> Female </label>
                                    <% } else { %>
                                        <input type="radio" name="gender" id="male" value="Male"> &nbsp; <label for="male" class="form-check-label"> Male </label>
                                        <input type="radio" name="gender" id="female" value="Female" class="ml-3" checked> &nbsp; <label for="female" class="form-check-label"> Female </label>
                                    <% } %>
                                </div>
                            </div>

                            <button class="btn btn-portal-primary btn-block">
                                Update Profile
                            </button>

                            <span class="error text-danger">
                                <%= request.getParameter("errorMsg") != null ? request.getParameter("errorMsg") : "" %>
                            </span>
                        </form>
                    </div>
                </div>
            </div>

            <div class="text-center mt-3 text-muted">
                <a href="index.jsp" class="text-dark">Back to home.</a>
            </div>
        </section>
    </div>

    <%@ include file = "./commons/components/templates/footer.jsp" %>    

    <script src="../../public/js/bootstrap.min.js"></script>
</body>
</html>