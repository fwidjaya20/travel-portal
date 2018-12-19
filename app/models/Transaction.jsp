<%!
public class Transaction extends Model {
	public int id;
	public String date;
	public int buyer;
	public String invoiceNumber;
	public String status;

	public Transaction(
		int id, 
		String date,
		int buyer,
		String invoiceNumber,
		String status
	) {
		this.id = id;
		this.date = date;
		this.buyer = buyer;
		this.invoiceNumber = invoiceNumber;
		this.status = status;
	}
}
%>