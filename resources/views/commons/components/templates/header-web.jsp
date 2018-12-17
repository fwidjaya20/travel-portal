<header class="template-header">
    <section class="header-top-bar">
        <div class="container d-flex justify-content-between">
            <span class="text-light"> The easiest way to find the cheapest ticket. </span>
            <ul class="nav-items">
                <% if (auth.getUser().role.equals("Admin")) { %>
                    <li class="nav-item">
                        <a href="transaction.jsp" class="nav-link text-light"> Dashboard </a>
                    </li>
                <% } %>
                <% if (auth.getUser().role.equals("Member")) { %>
                    <li class="nav-item">
                        <a href="track-order.jsp" class="nav-link text-light"> Track Order </a>
                    </li>
                <% } %>
                <% if (auth.getUser().role.equals("Guest")) { %>
                    <li class="nav-item">
                        <a href="login.jsp" class="nav-link text-light"> Sign In </a>
                    </li>
                    <li class="nav-item">
                        <a href="register.jsp" class="nav-link text-light"> Register </a>
                    </li>
                <% } %>
            </ul>
        </div>
    </section>