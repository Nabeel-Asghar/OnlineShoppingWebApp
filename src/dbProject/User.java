package dbProject;

public class User {
	
	private static int UserID;
	private static String FName;
	private static String LName;
	private static String Username;
	private static String Email;
	private static String Gender;
	private static String Age;
	
	public static void setLoginUserData(int userID, String fName, String lName,String username, String email, String gender, String age) {
		UserID = userID;
		FName = fName;
		LName = lName;
		Username = username; 
		Email = email;
		Gender = gender;
		Age = age;
	}
	
	public int getUserID() {
		return UserID;
	}
}
