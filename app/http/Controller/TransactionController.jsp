<%@ include file = "../../dtos/PassengerInformationDto.jsp" %>

<%!
public class TransactionController {
	private DBConnection db;
	private Auth auth;

	public TransactionController(Auth auth) {
		this.db = new DBConnection();
		this.auth = auth;
	}

	/**
	 * Store to Cart 
	 */
	public boolean addToCart(String flightId, String cabinType, ArrayList<PassengerInformationDto> passengerInformations) {
		String fillable = "person_title, person_name, person_nasionality, ticket, cabin_type, buyer";

		for (PassengerInformationDto dto : passengerInformations) {
			String values = "'"+dto.title+"','"+dto.name+"','"+dto.nasionality+"','"+flightId+"','"+cabinType+"','"+this.auth.getUser().id+"'";

			String QUERY = "INSERT INTO carts ("+ fillable +") VALUES ("+ values +")";

			System.out.println(QUERY);
		}

		return false;
	}
}
%>