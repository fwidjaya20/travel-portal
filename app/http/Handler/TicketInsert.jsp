<%@ include file = "../../../config/importer/Importer.jsp" %>
<%@ include file = "../Controller/TicketController.jsp" %>

<%
	String airline = request.getParameter("airline");
	String from_id = request.getParameter("from");
	String to_id = request.getParameter("to");
	String price_business = request.getParameter("price_business");
	String price_economy = request.getParameter("price_economy");
	String available = request.getParameter("available_seat");
	String depature_date = request.getParameter("depature_date");

	Validator validator = new Validator();
	String errorMsg = "";
	boolean hasError = false;

	if (validator.isEmpty(airline)) {
        errorMsg = "Airline must be filled!";
        hasError = true;
    } else if (validator.isEmpty(from_id)) {
        errorMsg = "City from must be filled!";
        hasError = true;
	} else if (validator.isEmpty(to_id)) {
        errorMsg = "City to must be filled!";
        hasError = true;
	} else if (validator.isEmpty(price_economy)) {
        errorMsg = "Price economy from must be filled!";
        hasError = true;
	} else if (validator.isEmpty(price_business)) {
    	errorMsg = "Price business must be filled!";
        hasError = true;
	} else if (validator.isEmpty(available)) {
        errorMsg = "Ticket available must be filled!";
        hasError = true;
   	} else if (validator.isEmpty(depature_date)) {
   		errorMsg = "Ticket depature date must be filled!";
        hasError = true;
	} else if (!validator.isNumeric(price_economy)) {
        errorMsg = "Ticket Price must be numeric value!";
        hasError = true;
	} else if (!validator.isNumeric(price_business)) {
        errorMsg = "Ticket Price must be numeric value!";
        hasError = true;
	} else if (!validator.isNumeric(available)) {
        errorMsg = "Ticket available must be numeric value!";
        hasError = true;
	} else {
		errorMsg = "";
		hasError = false;
	}

	if (hasError) {
		response.sendRedirect("../../../resources/views/ticket-insert.jsp?errorMsg=" + errorMsg);
		return;
	}

	TicketController controller = new TicketController();

	if ( controller.insertTicket(airline, from_id, to_id, price_economy, price_business, available, depature_date) ) {
		response.sendRedirect("../../../resources/views/ticket.jsp");
	} else {
		errorMsg = "Ticket insertion failed! Please try again.";

		response.sendRedirect("../../../resources/views/ticket-insert.jsp?errorMsg=" + errorMsg);
	}
%>