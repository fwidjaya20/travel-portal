<%!
public class Ticket extends Model {
	public int id;
	public String airline;
	public int from_city;
	public int to_city;
	public int price_economy;
	public int price_business;
	public int available;
	public String depature_date;

	public Ticket(
		int id, 
		String airline,
		int from_city,
		int to_city,
		int price_economy,
		int price_business,
		int available,
		String depature_date
	) {
		this.id = id;
		this.airline = airline;
		this.from_city = from_city;
		this.to_city = to_city;
		this.price_economy = price_economy;
		this.price_business = price_business;
		this.available = available;
		this.depature_date = depature_date;
	}
}
%>