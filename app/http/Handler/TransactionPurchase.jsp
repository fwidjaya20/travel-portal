<%@ include file = "../../../config/importer/Importer.jsp" %>
<%@ include file = "../Controller/TransactionController.jsp" %>

<%
	TransactionController transactionController = new TransactionController(auth);

	if ( transactionController.purchaseTransaction() ) {
        response.sendRedirect("../../../resources/views/index.jsp");
    } else {
        String errorMsg = "Purchasing failed! Please try again!";

        response.sendRedirect("../../../resources/views/purchase-confirmation.jsp");
    }
%>