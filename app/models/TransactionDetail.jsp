<%!
public class TransactionDetail extends Model {
	public int id;
	public int transaction_id;
	public PassengerInformationDto personalInformation;
	public int ticket_id;
	public String cabinType;

	public TransactionDetail(
		int id,
		int transaction_id,
		PassengerInformationDto personalInformation,
		int ticket_id,
		String cabinType
	) {
		this.id = id;
		this.transaction_id = transaction_id;
		this.personalInformation = personalInformation;
		this.ticket_id = ticket_id;
		this.cabinType = cabinType;
	}
}
%>