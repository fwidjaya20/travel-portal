<%!
public class City extends Model {
	public int id;
	public String city;
	public String country;

	public City(
		int id, 
		String city, 
		String country
	) {
		this.id = id;
		this.city = city;
		this.country = country;
	}
}
%>