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

    public void setUserAsGuest() {
        this.user = new User(0, "", "", "", "Guest", "", 0);
    }

    public User getUser() {
    	return this.user;
    }
}
%>