<%@ include file = "../../models/City.jsp" %>

<%!
public class CityController {
	private DBConnection db;

	public CityController() {
		this.db = new DBConnection();
	}

	public boolean insertCity(String city, String country) {
		String QUERY = "INSERT INTO cities (city,country) VALUES('"+city+"','"+country+"')";

		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public boolean updateCity(String id, String city, String country) {
		String QUERY = "UPDATE cities SET city='"+ city +"', country='"+ country +"' WHERE id='"+ id +"'";

		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public boolean deleteCity(String id) {
		String QUERY = "DELETE FROM cities WHERE id='"+ id +"'";
		
		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public ArrayList<City> getCities() {
		ArrayList<City> cities = new ArrayList<City>();

		String QUERY = "SELECT * FROM cities";
		
		try {
			ResultSet rs = db.st.executeQuery(QUERY);

			while(rs.next()) {
				City city = new City(
					Integer.parseInt(rs.getString("id").toString()),
					rs.getString("city"),
					rs.getString("country")
				);

				cities.add(city);
			}
		} catch(Exception e) {}

		return cities;
	}

	public City getCityById(String id) {
		String QUERY = "SELECT * FROM cities WHERE id='"+id+"'";

		try {
			ResultSet rs = db.st.executeQuery(QUERY);

			if (rs.next()) {
				City city = new City(
					Integer.parseInt(rs.getString("id").toString()),
					rs.getString("city"),
					rs.getString("country")
				);

				return city;
			}

			return null;
		} catch(Exception e) {
			return null;
		}
	}
}
%>