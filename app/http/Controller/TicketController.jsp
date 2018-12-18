<%@ include file = "../../models/Ticket.jsp" %>

<%!
public class TicketController {
	private DBConnection db;

	public TicketController() {
		this.db = new DBConnection();
	}

	public boolean insertTicket(String airline, String from_id, String to_id, String price_economy, String price_business, String available, String depature_date) {
		String QUERY = "INSERT INTO tickets (airline, from_city, to_city, price_economy, price_business, available, depature_date) VALUES('"+airline+"','"+from_id+"','"+to_id+"','"+price_economy+"','"+price_business+"','"+available+"','"+depature_date+"')";

		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public boolean updateTicket(String id, String airline, String from_id, String to_id, String price_economy, String price_business, String available, String depature_date) {
		String QUERY = "UPDATE tickets SET airline='"+ airline +"', from_city='"+ from_id +"', to_city='"+ to_id +"', price_economy='"+ price_economy +"', price_business='"+ price_business +"', available='"+ available +"', depature_date='"+ depature_date +"' WHERE id='"+ id +"'";

		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public boolean deleteTicket(String id) {
		String QUERY = "DELETE FROM tickets WHERE id='"+ id +"'";
		
		try {
			db.st.executeUpdate(QUERY);

			return true;
		} catch(Exception e) {
			return false;
		}
	}

	public ArrayList<Ticket> filterTicket(String from, String to, String depature_date, String passengers) {
		ArrayList<Ticket> tickets = new ArrayList<Ticket>();

		String QUERY = "SELECT * FROM tickets WHERE from_city='"+from+"' AND to_city='"+to+"' AND depature_date='"+depature_date+"' AND available>='"+passengers+"'";

		try {
			ResultSet rs = db.st.executeQuery(QUERY);

			while(rs.next()) {
				Ticket ticket = new Ticket(
					Integer.parseInt(rs.getString("id").toString()),
					rs.getString("airline"),
					Integer.parseInt(rs.getString("from_city").toString()),
					Integer.parseInt(rs.getString("to_city").toString()),
					Integer.parseInt(rs.getString("price_economy").toString()),
					Integer.parseInt(rs.getString("price_business").toString()),
					Integer.parseInt(rs.getString("available").toString()),
					rs.getString("depature_date").toString()
				);

				tickets.add(ticket);
			}
		} catch(Exception e) {}

		return tickets;
	}

	public ArrayList<Ticket> getTickets() {
		ArrayList<Ticket> tickets = new ArrayList<Ticket>();

		String QUERY = "SELECT * FROM tickets";
		
		try {
			ResultSet rs = db.st.executeQuery(QUERY);

			while(rs.next()) {
				Ticket ticket = new Ticket(
					Integer.parseInt(rs.getString("id").toString()),
					rs.getString("airline"),
					Integer.parseInt(rs.getString("from_city").toString()),
					Integer.parseInt(rs.getString("to_city").toString()),
					Integer.parseInt(rs.getString("price_economy").toString()),
					Integer.parseInt(rs.getString("price_business").toString()),
					Integer.parseInt(rs.getString("available").toString()),
					rs.getString("depature_date").toString()
				);

				tickets.add(ticket);
			}
		} catch(Exception e) {}

		return tickets;
	}

	public Ticket getTicketById(String id) {
		String QUERY = "SELECT * FROM tickets WHERE id='"+id+"'";

		try {
			ResultSet rs = db.st.executeQuery(QUERY);

			if (rs.next()) {
				Ticket ticket = new Ticket(
					Integer.parseInt(rs.getString("id").toString()),
					rs.getString("airline"),
					Integer.parseInt(rs.getString("from_city").toString()),
					Integer.parseInt(rs.getString("to_city").toString()),
					Integer.parseInt(rs.getString("price_economy").toString()),
					Integer.parseInt(rs.getString("price_business").toString()),
					Integer.parseInt(rs.getString("available").toString()),
					rs.getString("depature_date").toString()
				);

				return ticket;
			}

			return null;
		} catch(Exception e) {
			return null;
		}
	}
}
%>