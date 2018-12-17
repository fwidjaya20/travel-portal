<%@ page import="java.io.*, java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ include file="../database/Connection.jsp" %>
<%@ include file="../auth/Auth.jsp" %>
<%@ include file="../shared/Validator/Validator.jsp" %>

<%@ include file="../../app/models/Model.jsp" %>
<%@ include file="../../app/models/User.jsp" %>

<%
	Auth auth = new Auth(application, session, request, response);
	auth.checkForSessionAndCookies();
%>