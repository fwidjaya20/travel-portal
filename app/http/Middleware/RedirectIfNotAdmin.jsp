<%
if (!auth.getUser().role.equals("Admin")) {
	response.sendRedirect("../../resources/views/index.jsp");
}
%>