<%@ include file = "../../../config/importer/Importer.jsp" %>
<%@ include file = "../Controller/AuthenticateController.jsp" %>

<%
	AuthenticateController controller = new AuthenticateController(auth);

	if ( controller.logout() ) {
		response.sendRedirect("../../../resources/views/index.jsp");
	}
%>