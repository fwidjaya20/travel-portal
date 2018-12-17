<header class="template-header">
    <section class="header-top-bar">
        <div class="container d-flex">
            <span class="text-light mr-auto">
                <ul class="nav-items">
                    <li class="nav-item mr-2">
                        <a href="index.jsp" class="text-light"> Home </a>
                    </li>
                    <% if (auth.getUser().role.equals("Admin")) { %>
                        <li class="nav-item position-relative mr-2 has-dropmenu">
                            <a href="user.jsp" class="text-light"> Users </a>

                            <ul class="dropdown">
                                <li class="dropdown-item">
                                    <a href="user-insert.jsp" class="text-dark"> Insert User </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item position-relative mr-2 has-dropmenu">
                            <a href="city.jsp" class="text-light"> Cities </a>

                            <ul class="dropdown">
                                <li class="dropdown-item">
                                    <a href="city-insert.jsp" class="text-dark"> Insert City </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item position-relative mr-2 has-dropmenu">
                            <a href="ticket.jsp" class="text-light"> Tickets </a>

                            <ul class="dropdown">
                                <li class="dropdown-item">
                                    <a href="ticket-insert.jsp" class="text-dark"> Insert Ticket </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item position-relative mr-2 has-dropmenu">
                            <a href="transaction.jsp" class="text-light"> Transactions </a>

                            <ul class="dropdown">
                                <li class="dropdown-item">
                                    <a href="transaction-insert.jsp" class="text-dark"> Insert Transaction </a>
                                </li>
                            </ul>
                        </li>
                    <% } %>
                </ul>
            </span>
            <ul class="nav-items">
                <li class="nav-item position-relative has-dropmenu">
                    <a href="javascript:;" class="nav-link text-light"> <%= auth.getUser().name %> </a>

                    <ul class="dropdown">
                        <li class="dropdown-item">
                            <a href="profile.jsp" class="text-dark"> Edit Profile </a>
                        </li>
                        <li class="dropdown-item">
                            <a href="../../../../app/http/Handler/Logout.jsp" class="text-dark"> Logout </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </section>