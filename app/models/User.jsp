<%!
public class User extends Model {
	public Integer id;
	public String name;
	public String email;
	public String password;
	public String role;
	public String gender;
	public Integer point;

	public User(
		Integer id, 
		String name, 
		String email,
		String password,
		String role,
		String gender,
		Integer point
	) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.role = role;
		this.gender = gender;
		this.point = point;
	}
}
%>