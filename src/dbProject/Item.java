package dbProject;

public class Item {
	
	private static int Itemid;
	private static double Price;
	private static String Title;
	private static String Dscrp;
	private static String Date;
	private static String Category;
	private static int Userid;
	
	public static void setItemData(int itemid, double price, String title, String dscrp, String date, String category,int userid) {
		Itemid = itemid;
		Price = price;
		Title = title;
		Dscrp = dscrp;
		Date = date;
		Category = category;
		Userid=userid;
	}
	
	public int getItemID() {
		return Itemid;
	}

}
