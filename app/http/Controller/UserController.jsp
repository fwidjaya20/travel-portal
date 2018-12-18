<%!
public class UserController {
	private DBConnection db;

	public UserController() {
		this.db = new DBConnection();
	}

	public boolean insertUser(String name, String email, String password, String gender) {
		String QUERY = "INSERT INTO users (name,email,password,gender,role,point) VALUES('"+name+"','"+email+"','"+password+"','"+gender+"', 'Member','0')";

		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public boolean updateUser(String id, String name, String email, String password, String gender) {
		String QUERY = "UPDATE users SET name='"+ name +"', email='"+ email +"', password='"+ password +"', gender='"+ gender +"' WHERE id='"+ id +"'";

		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public boolean deleteUser(String id) {
		String QUERY = "DELETE FROM users WHERE id='"+ id +"'";
		
		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public ArrayList<User> getUsers() {
		ArrayList<User> users = new ArrayList<User>();

		String QUERY = "SELECT * FROM users";
		
		try {
			ResultSet rs = db.st.executeQuery(QUERY);

			while(rs.next()) {
				User user = new User(
					Integer.parseInt(rs.getString("id").toString()),
					rs.getString("name"),
					rs.getString("email"),
					rs.getString("password"),
					rs.getString("role"),
					rs.getString("gender"),
					Integer.parseInt(rs.getString("point").toString())
				);

				users.add(user);
			}
		} catch(Exception e) {}

		return users;
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