<%@ include file = "../../../config/importer/Importer.jsp" %>
<%@ include file = "../Controller/CityController.jsp" %>

<%
	String id = request.getParameter("id");

	String errorMsg = "";

	CityController controller = new CityController();

	if ( controller.deleteCity(id) ) {
		response.sendRedirect("../../../resources/views/city.jsp");
	} else {
		errorMsg = "City delete failed! Please try again.";

		response.sendRedirect("../../../resources/views/city.jsp?errorMsg=" + errorMsg);
	}
%>