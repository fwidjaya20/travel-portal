<%!
public class PassengerInformationDto extends Dto {
	public String title;
	public String name;
	public String nasionality;

	public PassengerInformationDto(
		String title, String name, String nasionality
	) {
		this.title = title;
		this.name = name;
		this.nasionality = nasionality;
	}
}
%>