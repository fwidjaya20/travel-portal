<%@ include file = "../../../config/importer/Importer.jsp" %>
<%@ include file = "../Controller/TransactionController.jsp" %>

<%
    TransactionController controller = new TransactionController(auth);

    controller.changeTransactionStatus(request.getParameter("id"), "Approved");

    response.sendRedirect("../../../resources/views/transaction.jsp");
%>