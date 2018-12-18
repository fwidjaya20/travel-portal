<%@ include file = "../../../config/importer/Importer.jsp" %>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String gender = request.getParameter("gender");

	Validator validator = new Validator();
	String errorMsg = "";
	boolean hasError = false;

	if (validator.isEmpty(id)) {
		errorMsg = "Cant update user! ID is missing.";
		hasError = true;
	} else if (validator.isEmpty(name)){
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
	} else if (validator.isEmpty(gender)) {
    	errorMsg = "Gender must be selected!";
        hasError = true;
	} else {
		errorMsg = "";
		hasError = false;
	}

	if (hasError) {
		response.sendRedirect("../../../resources/views/user-update.jsp?errorMsg=" + errorMsg);
		return;
	}

	UserController controller = new UserController();

	if ( controller.updateUser(id, name, email, password, gender) ) {
		response.sendRedirect("../../../resources/views/user.jsp");
	} else {
		errorMsg = "User insertion failed! Please try again.";

		response.sendRedirect("../../../resources/views/user-update.jsp?errorMsg=" + errorMsg);
	}
%>