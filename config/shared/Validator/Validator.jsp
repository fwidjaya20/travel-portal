<%!
public class Validator{
	public boolean isEmpty(Object str){
		if(str == null || str.toString().equals("")){
			return true;
		}
		else{
			return false;
		}
	}
	public boolean isAlphaNumeric(String str){
		for(int i = 0 ; i < str.length() ; i++){
			if(!Character.isDigit(str.charAt(i)) && !Character.isLetter(str.charAt(i))){
				return false;
			}
		}
		return true;
	}
	public boolean isAlphabet(String str){
		for(int i = 0 ; i < str.length() ; i++){
			if(!Character.isLetter(str.charAt(i)) && str.charAt(i) != ' '){// alphabet or space
				return false;
			}
		}
		return true;
	}
	public boolean isNumeric(String str){
		for(int i = 0 ; i < str.length() ; i++){
			if(!Character.isDigit(str.charAt(i))){
				return false;
			}
		}
		return true;
	}
	public boolean isContainSymbolNumberAlpha(String str){
		boolean containSymbol = false;
		boolean containNumber = false;
		boolean containAlpha = false;

		for(int i = 0 ; i < str.length() ; i++){
			if(Character.isDigit(str.charAt(i)))
				containNumber = true;
			if(Character.isLetter(str.charAt(i)))
				containAlpha = true;
			if(!Character.isLetter(str.charAt(i)) && !Character.isDigit(str.charAt(i)) && !Character.isWhitespace(str.charAt(i)))
				containSymbol = true;
		}

		return containSymbol && containNumber && containAlpha;
	}
	public boolean isEmailFormat(String str){
		if(str.length() < 4)
			return false;
		else if(str.indexOf('@') == -1 || str.indexOf('.') == -1)
			return false;
		else if(str.indexOf('@') != str.lastIndexOf('@'))
			return false;
		else if(str.indexOf('.') - str.indexOf('@') < 0)
			return false;
		else if(str.indexOf('.') - str.indexOf('@') == 1)
			return false;

		return true;
	}
}
%>