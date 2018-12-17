<%!
public class UserController {
	private DBConnection db;

	public UserController() {
		this.db = new DBConnection();
	}

	public boolean updateUser(int id, String name, String email, String password, String gender) {
		String QUERY = "UPDATE users SET name='"+ name +"', email='"+ email +"', password='"+ password +"', gender='"+ gender +"' WHERE id='"+ id +"'";

		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public User getUserById(String id) {
		DBConnection db = new DBConnection();

		String QUERY = "SELECT * FROM users WHERE id='"+id+"'";

		try {
			ResultSet rs = db.st.executeQuery(QUERY);

			if (rs.next()) {
				User user = new User(
					Integer.parseInt(rs.getString("id").toString()),
					rs.getString("name"),
					rs.getString("email"),
					rs.getString("password"),
					rs.getString("role"),
					rs.getString("gender"),
					Integer.parseInt(rs.getString("point").toString())
				);

				return user;
			}

			return null;
		} catch(Exception e) {
			return null;
		}
	}
}
%>