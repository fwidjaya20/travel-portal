<%@ include file = "../../../config/importer/Importer.jsp" %>
<%@ include file = "../Controller/TransactionController.jsp" %>

<%
    TransactionController controller = new TransactionController(auth);

    int id = Integer.parseInt( request.getParameter("id") );
    int transactionId = Integer.parseInt( request.getParameter("transaction_id") );

    controller.deleteItemFromTransactionDetails(id, transactionId);

    response.sendRedirect("../../../resources/views/transaction.jsp");
%>