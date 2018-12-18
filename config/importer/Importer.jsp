<%@ page import="java.io.*, java.util.*, javax.servlet.*, java.text.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.Date" %>

<%@ include file="../database/Connection.jsp" %>
<%@ include file="../auth/Auth.jsp" %>
<%@ include file="../shared/Validator/Validator.jsp" %>

<%@ include file="../../app/models/Model.jsp" %>
<%@ include file="../../app/dtos/Dto.jsp" %>
<%@ include file="../../app/models/User.jsp" %>

<%
	Auth auth = new Auth(application, session, request, response);
	auth.checkForSessionAndCookies();
%>