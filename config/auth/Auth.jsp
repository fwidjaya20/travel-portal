<%@ include file = "../../app/http/Controller/UserController.jsp" %>
<%!
public class Auth {
	private ServletContext application;
    private HttpSession session;
    private HttpServletRequest request;
    private HttpServletResponse response;

    private User user;

    public Auth(
    	ServletContext application,
    	HttpSession session,
    	HttpServletRequest request,
    	HttpServletResponse response
	) {
        this.application = application;
        this.session = session;
        this.request = request;
        this.response = response;

        this.setUserAsGuest();
    }

    public void checkForSessionAndCookies(){
        String userID = null;

        Validator validator =  new Validator();

        if(null != session.getAttribute("user")){
            userID = (String) session.getAttribute("user").toString();

            this.user = new UserController().getUserById(userID);
        }
    }


    public void setUserSession(User user) {
        if (user != null) {
            this.user = user;

            session.setAttribute("user", user.id);
        }
    }

    public void setUserCookies(User user) {
        
    }

    public void incrementUserLoggedIn(){
        Integer userOnline = (Integer) application.getAttribute("onlineCount");
        if(userOnline == null)
            userOnline = new Integer(0);
        application.setAttribute("onlineCount", userOnline+1);
    }

    public void decrementUserLoggedIn(){
        Integer userOnline = (Integer) application.getAttribute("onlineCount");
        if(userOnline == null)
            userOnline = new Integer(0);
        application.setAttribute("onlineCount", userOnline-1);
    }

    public Integer getUserCount(){
        Integer userOnline = (Integer) application.getAttribute("onlineCount");
        if(userOnline == null) {
            userOnline = new Integer(0);
        }
        return userOnline;
    }
    
    public void clearSession(){
        session.removeAttribute("user");
        session.invalidate();
    }

    public void clearCookie(){
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(int i = 0 ; i < cookies.length ; i++){
                Cookie cookie = cookies[i];
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
        }
    }

    public void setUserAsGuest() {
        this.user = new User(0, "", "", "", "Guest", "", 0);
    }

    public User getUser() {
    	return this.user;
    }
}
%>