<%
if (!auth.getUser().role.equals("Guest")) {
	response.sendRedirect("../../resources/views/index.jsp");
}
%>