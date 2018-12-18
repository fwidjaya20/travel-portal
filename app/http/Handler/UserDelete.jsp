<%@ include file = "../../../config/importer/Importer.jsp" %>

<%
	String id = request.getParameter("id");

	String errorMsg = "";

	UserController controller = new UserController();

	if ( controller.deleteUser(id) ) {
		response.sendRedirect("../../../resources/views/user.jsp");
	} else {
		errorMsg = "User delete failed! Please try again.";

		response.sendRedirect("../../../resources/views/user.jsp?errorMsg=" + errorMsg);
	}
%>