<%@ include file = "../../../config/importer/Importer.jsp" %>
<%@ include file = "../Controller/AuthenticateController.jsp" %>

<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String password_c = request.getParameter("password_c");
	String gender = request.getParameter("gender");

	Validator validator = new Validator();
	String errorMsg = "";
	boolean hasError = false;

	if (validator.isEmpty(name)){
        errorMsg = "Name must be filled!";
        hasError = true;
    } else if (validator.isEmpty(email)) {
    	errorMsg = "Email must be filled!";
        hasError = true;
	} else if (!validator.isEmailFormat(email)) {
    	errorMsg = "Incorrect email format!";
        hasError = true;
	} else if (validator.isEmpty(password)) {
    	errorMsg = "Password must be filled!";
        hasError = true;
	} else if (!password.equals(password_c)) {
    	errorMsg = "Password Confirmation must be same with Password!";
        hasError = true;
	} else if (validator.isEmpty(gender)) {
    	errorMsg = "Gender must be selected!";
        hasError = true;
	} else {
		errorMsg = "";
		hasError = false;
	}

	if (hasError) {
		response.sendRedirect("../../../resources/views/register.jsp?errorMsg=" + errorMsg);
		return;
	}

	AuthenticateController controller = new AuthenticateController(auth);

	if ( controller.register(name, email, password, gender) ) {
		response.sendRedirect("../../../resources/views/login.jsp");
	} else {
		errorMsg = "Register failed! Please try again.";

		response.sendRedirect("../../../resources/views/register.jsp?errorMsg=" + errorMsg);
	}
%>