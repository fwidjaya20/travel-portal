<%@ include file = "../../../config/importer/Importer.jsp" %>
<%@ include file = "../Controller/CityController.jsp" %>

<%
	String id = request.getParameter("id");
	String city = request.getParameter("city");
	String country = request.getParameter("country");

	Validator validator = new Validator();
	String errorMsg = "";
	boolean hasError = false;

	if (validator.isEmpty(id)) {
		errorMsg = "Id must be filled!";
		hasError = true;
	} else if (validator.isEmpty(city)){
        errorMsg = "City must be filled!";
        hasError = true;
    } else if (validator.isEmpty(country)) {
    	errorMsg = "Country must be filled!";
        hasError = true;
	} else {
		errorMsg = "";
		hasError = false;
	}

	if (hasError) {
		response.sendRedirect("../../../resources/views/city-update.jsp?errorMsg=" + errorMsg);
		return;
	}

	CityController controller = new CityController();

	if ( controller.updateCity(id, city, country) ) {
		response.sendRedirect("../../../resources/views/city.jsp");
	} else {
		errorMsg = "City update failed! Please try again.";

		response.sendRedirect("../../../resources/views/city-update.jsp?errorMsg=" + errorMsg);
	}
%>