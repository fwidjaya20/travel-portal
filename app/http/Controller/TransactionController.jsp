<%@ include file = "./TicketController.jsp" %>
<%@ include file = "../../models/Cart.jsp" %>
<%@ include file = "../../models/Transaction.jsp" %>
<%@ include file = "../../models/TransactionDetail.jsp" %>

<%!
public class TransactionController {
	private DBConnection db;
	private Auth auth;

	public TransactionController(Auth auth) {
		this.db = new DBConnection();
		this.auth = auth;
	}

	/**
	 * Attempt all items on cart as Purchased Transaction
	 */
	public boolean purchaseTransaction() {
		ArrayList<Cart> carts = this.getLoggedUserCart();

		String invoiceNumber = this.generateInvoiceNumber();
		String headerFillables = "date, buyer, invoice_number, status";
		String headerValues = "'"+this.getCurrentDate("Y-M-d")+"', '"+this.auth.getUser().id+"', '"+invoiceNumber+"', 'Pending'";
		String QUERY_HEADER = "INSERT INTO transactions ("+headerFillables+") VALUES ("+headerValues+")";

		Transaction currentTransaction;

		try {
			db.st.executeUpdate(QUERY_HEADER);

			currentTransaction = this.getTransactionByInvoiceNumber(invoiceNumber);
		} catch(Exception e) {
			currentTransaction = null;
		}

		if (currentTransaction == null) {
			return false;
		}
		
		String detailFillables = "transaction_id, person_title, person_name, person_nasionality, ticket, ticket_type";
		
		for (Cart c : carts) {
			String detailValues = "'"+currentTransaction.id+"', '"+c.personInformation.title+"', '"+c.personInformation.name+"', '"+c.personInformation.nasionality+"', '"+c.ticket.id+"', '"+c.cabinType+"'";
			String QUERY_DETAIL = "INSERT INTO transaction_details ("+detailFillables+") VALUES ("+detailValues+")";

			try {
				db.st.executeUpdate(QUERY_DETAIL);
			} catch(Exception e) {
				return false;
			}
		}

		boolean isDecreased = new TicketController().decreaseTicketAvailable(carts.get(0).ticket.id, carts.size());
		if ( !isDecreased ) {
			return false;
		}

		if ( !this.deleteUserCart() ) {
			return false;
		}

		return true;
	}

	/**
	 * Changing Transaction Status to Any State
	 */
	public boolean changeTransactionStatus(String transactionId, String status) {
		String QUERY = "UPDATE transactions SET status='"+ status +"' WHERE id='"+ transactionId +"'";

		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	/**
	 * Changing Transaction Status to Canceled State
	 */
	public boolean cancelTransaction(String transactionId) {
		String QUERY = "UPDATE transactions SET status='Canceled' WHERE id='"+ transactionId +"'";

		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	/**
	 * Delete item on Transaction Details 
	 */
	public boolean deleteItemFromTransactionDetails(int id, int transactionId) {
		String QUERY = "DELETE FROM transaction_details WHERE id='"+ id +"' AND transaction_id='"+transactionId+"'";

		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public Transaction getTransactionByInvoiceNumber(String invoiceNumber) {
		String QUERY = "SELECT * FROM transactions WHERE invoice_number='"+invoiceNumber+"'";

		try {
			ResultSet rs = db.st.executeQuery(QUERY);

			if (rs.next()) {
				Transaction transaction = new Transaction(
					Integer.parseInt(rs.getString("id").toString()),
					rs.getString("date"),
					Integer.parseInt(rs.getString("buyer").toString()),
					rs.getString("invoice_number"),
					rs.getString("status")
				);

				return transaction;
			}

			return null;
		} catch(Exception e) {
			return null;
		}
	}

	public ArrayList<Transaction> getTransactions() {
		ArrayList<Transaction> transactions = new ArrayList<Transaction>();

		String QUERY = "SELECT * FROM transactions ORDER BY date, status ";

		try {
			ResultSet rs = db.st.executeQuery(QUERY);

			while (rs.next()) {
				Transaction transaction = new Transaction(
					Integer.parseInt(rs.getString("id").toString()),
					rs.getString("date"),
					Integer.parseInt(rs.getString("buyer").toString()),
					rs.getString("invoice_number"),
					rs.getString("status")
				);

				transactions.add(transaction);
			}
		} catch(Exception e) {}

		return transactions;
	}

	public ArrayList<TransactionDetail> getTransactionDetials(String transactionId) {
		ArrayList<TransactionDetail> transactions = new ArrayList<TransactionDetail>();

		String QUERY = "SELECT * FROM transaction_details WHERE transaction_id='"+transactionId+"'";

		try {
			ResultSet rs = db.st.executeQuery(QUERY);

			while (rs.next()) {
				TransactionDetail transaction = new TransactionDetail(
					Integer.parseInt(rs.getString("id").toString()),
					Integer.parseInt(rs.getString("transaction_id").toString()),
					new PassengerInformationDto(
						rs.getString("person_title").toString(),
						rs.getString("person_name").toString(),
						rs.getString("person_nasionality").toString()
					),
					Integer.parseInt(rs.getString("ticket").toString()),
					rs.getString("ticket_type")
				);

				transactions.add(transaction);
			}
		} catch(Exception e) {}

		return transactions;
	}

	/**
	 * Store to Cart 
	 */
	public boolean addToCart(String flightId, String cabinType, ArrayList<PassengerInformationDto> passengerInformations) {
		String fillable = "person_title, person_name, person_nasionality, ticket, cabin_type, buyer";

		for (PassengerInformationDto dto : passengerInformations) {
			String values = "'"+dto.title+"','"+dto.name+"','"+dto.nasionality+"','"+flightId+"','"+cabinType+"','"+this.auth.getUser().id+"'";

			String QUERY = "INSERT INTO carts ("+ fillable +") VALUES ("+ values +")";

			try {
				db.st.executeUpdate(QUERY);
			} catch(Exception e) {
				return false;
			}
		}

		return true;
	}

	/**
	 * Delete logged user cart items
	 */
	public boolean deleteUserCart() {
		String QUERY = "DELETE FROM carts WHERE buyer='"+ this.auth.getUser().id +"'";
		
		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	/**
	 * Get logged user cart items
	 */
	public ArrayList<Cart> getLoggedUserCart() {
		ArrayList<Cart> carts = new ArrayList<Cart>();

		String QUERY = "SELECT * FROM carts WHERE buyer='"+this.auth.getUser().id+"'";

		try {
			ResultSet rs = db.st.executeQuery(QUERY);

			while(rs.next()) {
				Cart cart = new Cart(
					Integer.parseInt(rs.getString("id").toString()),
					new PassengerInformationDto(
						rs.getString("person_title").toString(),
						rs.getString("person_name").toString(),
						rs.getString("person_nasionality").toString()
					),
					new TicketController().getTicketById(rs.getString("ticket").toString()),
					rs.getString("cabin_type").toString(),
					this.auth.getUser()
				);

				carts.add(cart);
			}
		} catch(Exception e) {}

		return carts;
	}

	public String getCurrentDate(String format) {
		Date d = new Date();

        DateFormat dateFormat = new SimpleDateFormat(format);

        return dateFormat.format(d);
	}

	private String generateInvoiceNumber() {
		Date d = new Date();

		String currentDate = this.getCurrentDate("YMd");

		return "INV/" + currentDate + "/" + d.getTime();
	}
}
%>