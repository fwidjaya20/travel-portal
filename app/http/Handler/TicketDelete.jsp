<%@ include file = "../../../config/importer/Importer.jsp" %>
<%@ include file = "../Controller/TicketController.jsp" %>

<%
	String id = request.getParameter("id");

	String errorMsg = "";

	TicketController controller = new TicketController();

	if ( controller.deleteTicket(id) ) {
		response.sendRedirect("../../../resources/views/ticket.jsp");
	} else {
		errorMsg = "Ticket delete failed! Please try again.";

		response.sendRedirect("../../../resources/views/ticket.jsp?errorMsg=" + errorMsg);
	}
%>