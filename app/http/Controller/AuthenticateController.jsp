<%!
public class AuthenticateController {
	private Auth auth;

	public AuthenticateController(Auth auth) {
		this.auth = auth;
	}

	public boolean login(String email, String password, boolean isRemember) {
		DBConnection db = new DBConnection();

		String QUERY = "SELECT * FROM users WHERE email='"+email+"' AND password='"+password+"'";

		try {
			ResultSet rs = db.st.executeQuery(QUERY);

			if (rs.next()) {
				// Set to Session
				if (isRemember) {
					// Set to Cookies
				}
				// Set User Count on Application
				return true;
			}

			return false;
		} catch(Exception e) {
			return false;
		}
	}

	public boolean register(String name, String email, String password, String gender) {
		DBConnection db = new DBConnection();

		String QUERY = "INSERT INTO users (name,email,password,gender,role,point) VALUES('"+name+"','"+email+"','"+password+"','"+gender+"', 'Member','0')";

		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public boolean logout() {
		return false;
	}
}
%>