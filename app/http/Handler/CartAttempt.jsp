<%@ include file = "../../../config/importer/Importer.jsp" %>
<%@ include file = "../Controller/TransactionController.jsp" %>

<%
	String flight_id = request.getParameter("flight_id");
    String passenger = request.getParameter("passengers");
    String cabin_class = request.getParameter("cabin_class");

    String errorMsg = "";
    String requiredParam = "flight_id=" + flight_id + "&passengers=" + passenger + "&cabin_class=" + cabin_class;

    ArrayList<PassengerInformationDto> passengerInformations = new ArrayList<PassengerInformationDto>();
    Validator validator = new Validator();

    for (int i = 1 ; i <= Integer.parseInt(passenger) ; i++) {
    	if (validator.isEmpty(request.getParameter("person_name_" + i))) {
    		errorMsg = "Personal Information must be filled!";
			requiredParam += "&errorMsg=" + errorMsg;

			response.sendRedirect("../../../resources/views/purchase-pi.jsp?" + requiredParam);
			break;
    	}

    	PassengerInformationDto dto = new PassengerInformationDto(
    		request.getParameter("person_title_" + i),
    		request.getParameter("person_name_" + i),
    		request.getParameter("person_nasionality_" + i)
    	);

    	passengerInformations.add(dto);
	}

	TransactionController transactionController = new TransactionController(auth);

	if ( transactionController.addToCart(flight_id, cabin_class, passengerInformations) ) {
        response.sendRedirect("../../../resources/views/purchase-confirmation.jsp");
    } else {
        errorMsg = "Purchasing failed! Please try again!";
        requiredParam += "&errorMsg=" + errorMsg;

        response.sendRedirect("../../../resources/views/purchase-pi.jsp?" + requiredParam);
    }
%>