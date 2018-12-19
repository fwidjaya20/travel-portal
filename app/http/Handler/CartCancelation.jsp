<%@ include file = "../../../config/importer/Importer.jsp" %>
<%@ include file = "../Controller/TransactionController.jsp" %>

<%
    String errorMsg = "";

    TransactionController controller = new TransactionController(auth);

    if ( controller.deleteUserCart() ) {
        response.sendRedirect("../../../resources/views/index.jsp");
    } else {
        errorMsg = "Carts delete failed! Please try again.";

        response.sendRedirect("../../../resources/views/purchase-information.jsp?errorMsg=" + errorMsg);
    }
%>