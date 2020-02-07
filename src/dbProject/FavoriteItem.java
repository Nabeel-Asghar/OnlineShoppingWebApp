package dbProject;

public class FavoriteItem {
	
	private static int FavID;
	private static int UserID;
	private static int ItemID;
	private static double Price;
	private static String Title;
	private static String Dscrp;
	private static String Date;
	private static String Category;
	
	public static void setFavoriteData(int favid, int userid, int itemid,double price, String title, String dscrp, String date, String category) {
		UserID=userid;
		ItemID=itemid;
		Price= price;
		Title =title;
		Dscrp= dscrp;
		Date=date;
		Category=category;
				
	}
	public int getUserID() {
		return UserID;
	}
	public int getItemID() {
		return ItemID;
	}

}
