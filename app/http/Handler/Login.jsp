<%@ include file = "../../../config/importer/Importer.jsp" %>
<%@ include file = "../Controller/AuthenticateController.jsp" %>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	boolean isRemember = false;

	Validator validator = new Validator();
	String errorMsg = "";
	boolean hasError = false;

	 if (validator.isEmpty(email)) {
    	errorMsg = "Email must be filled!";
        hasError = true;
	} else if (!validator.isEmailFormat(email)) {
    	errorMsg = "Incorrect email format!";
        hasError = true;
	} else if (validator.isEmpty(password)){
        errorMsg = "Password must be filled!";
        hasError = true;
    } else {
		errorMsg = "";
		hasError = false;
	}

	if (null != request.getParameter("remember")) {
		isRemember = true;
	}

	if (hasError) {
		response.sendRedirect("../../../resources/views/login.jsp?errorMsg=" + errorMsg);
		return;
	}

	AuthenticateController controller = new AuthenticateController(auth);

	if ( controller.login(email, password, isRemember) ) {
		response.sendRedirect("../../../resources/views/index.jsp");
	} else {
		errorMsg = "Login failed! Please try again.";

		response.sendRedirect("../../../resources/views/login.jsp?errorMsg=" + errorMsg);
	}
%>