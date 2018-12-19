<%@ include file = "../dtos/PassengerInformationDto.jsp" %>

<%!
public class Cart extends Model {
	public int id;
	public PassengerInformationDto personInformation;
	public Ticket ticket;
	public String cabinType;
	public User buyer;

	public Cart(
		int id,
		PassengerInformationDto personInformation,
		Ticket ticket,
		String cabinType,
		User buyer
	) {
		this.id = id;
		this.personInformation = personInformation;
		this.ticket = ticket;
		this.cabinType = cabinType;
		this.buyer = buyer;
	}
}
%>