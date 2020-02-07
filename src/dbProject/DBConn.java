package dbProject;

import java.io.IOException;
import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DBConn")
public class DBConn extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	private Connection connect = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	private DBConn _DBConn = null;
	
	//public static String dbName = "jdbc:mysql://localhost/projectdb";
	//public static String dbUserName = "";
	//public static String dbPassword = "pass1234";
	
	protected void connect_func() throws SQLException {
        if (connect == null || connect.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            connect = (Connection) DriverManager
  			      .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
  			          + "user=john&password=pass1234");
            System.out.println(connect);
        }
	}

	public void createUsersTable() throws SQLException{      
		String sql = " CREATE TABLE users (\r\n" + 
				"   user_id INT NOT NULL auto_increment, 	\r\n" + 
				"   age varchar(255),\r\n" + 
				"   username varchar(255),\r\n" + 
				"   gender varchar(255),\r\n" + 
				"   email varchar(255),\r\n" + 
				"   first_name varchar(255),\r\n" + 
				"   last_name varchar(255),\r\n" + 
				"   user_pswrd varchar (255),\r\n" + 
				"   PRIMARY KEY(user_id)\r\n" + 
				");\r\n" + 
				"";
		connect_func();   
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.executeUpdate();
		
		String sql2 = "insert into users (user_id,age,username,gender,email,first_name,last_name,user_pswrd)\r\n" + 
				"values(1,21,'admin','male','admin@admin.com','admin','admin','admin'),\r\n" + 
				"(2,20,'JohnSmith','Male','john@gmail.com','John','Smith','1234'),\r\n" + 
				"(3,20,'KateSmith','Female','kate@gmail.com','Kate','Smith','1234'),\r\n" + 
				"(4,21, 'ShanRanch','Male','shan@gmail.com','Shan','Ranch','1234'),\r\n" + 
				"(5,21,'ShaunakVaghasia','Male','shaunak@gmail.com','Shaunak','Vaghasia','1234'),\r\n" + 
				"(6,21,'IrfanImthias','Male','irfan@gmail.com','Irfan','Imthias','1234'),\r\n" + 
				"(7,21,'HarshPatel','Male','harsh@gmail.com','Harsh','Patel','1234'),\r\n" + 
				"(8,21,'KashyapKandi','Male','kashyap@gmail.com','Kashyap','Kandi','1234'),\r\n" + 
				"(9,35,'LebronJames','Male','lebron@gmail.com','Lebron','James','1234'),\r\n" + 
				"(10,29,'AbelTesfaye','Male','abel@gmail.com','Abel','Tesfaye','1234');";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql2);
		preparedStatement.executeUpdate();
		System.out.println("Users created succesfully.");
		connect.close();
	}
	public void createItemsTable() throws SQLException{
		connect_func();         
		String sql = "CREATE TABLE items (\r\n" + 
				"     item_id INT NOT NULL auto_increment,\r\n" + 
				"     price double,\r\n" + 
				"     title varchar(255),\r\n" + 
				"     dscrp varchar(1000),\r\n" + 
				"     date_posted varchar(255),\r\n" + 
				"     category varchar(255),\r\n" + 
				"     userid INT,\r\n" + 
				"     PRIMARY KEY(item_id),\r\n" + 
				"     constraint userid\r\n" + 
				"     foreign key(userid)\r\n" + 
				"     references projectdb.users(user_id)\r\n" + 
				");";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.executeUpdate();
		
		String sql2 = "insert into items (item_id,price,title,dscrp,date_posted,category,userid)\r\n" + 
				"values (1, 1000, 'iPhoneX', 'Brand New IphoneX','04/01/2018','tech',5),\r\n" + 
				"(2,3,'Potato','Uneaten Potato','11/27/2019','food',2),\r\n" + 
				"(3,200,'Speaker','Brand New Speaker','01/01/2019','sound',10),\r\n" + 
				"(4,15,'Basketball','Used BasketBall','12/18/2018','sport',9),\r\n" + 
				"(5,250,'LG Monitor','New Monitor','11/27/2019','tech',2),\r\n" + 
				"(6,500,'Gold','Fresh Gold','04/12/2017','metals',3),\r\n" + 
				"(7,780,'Painting','Remake of Raphael','06/12/2019','art',4),\r\n" + 
				"(8, 10, 'Onions','Fresh Onions','10/12/2019','food',6),\r\n" + 
				"(9, 6500,'Toyota Camry','2012 Toyota Camry','10/12/2019','automobiles',7),\r\n" + 
				"(10,30,'Hammer','Brand new Hammer','12/16/2018','tools',8);";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql2);
		preparedStatement.executeUpdate();
		System.out.println("Items created succesfully.");
		connect.close();
	}
	public void createShoppingCartTable() throws SQLException{
		connect_func();         
		String sql = "create table shoppingCart(\r\n" + 
				"	cart_id INT NOT NULL auto_increment,\r\n" + 
				"    itemC_id INT,\r\n" + 
				"    userC_id INT,\r\n" + 
				"    price double,\r\n" + 
				"    dscrp varchar(255),\r\n" + 
				"    title varchar(255),\r\n" + 
				"    PRIMARY KEY (cart_id),\r\n" + 
				"    constraint userC_id\r\n" + 
				"    foreign key (userC_id)\r\n" + 
				"    references projectdb.users(user_id),\r\n" + 
				"    constraint itemC_id\r\n" + 
				"    foreign key(itemC_id)\r\n" + 
				"    references projectdb.items(item_id)\r\n" + 
				");";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.executeUpdate();
		
		String sql2 = "insert into shoppingCart(cart_id,itemC_id,userC_id,price,dscrp,title)\r\n" + 
				"values (1,1,10,1000,'Brand New IphoneX','iPhoneX'),\r\n" + 
				"(2,2,9,3,'Uneaten Potato','Potato'),\r\n" + 
				"(3,3,8,200,'Brand New Speaker','Speaker'),\r\n" + 
				"(4,4,7,15,'Used BasketBall','Baskeball'),\r\n" + 
				"(5,5,6,250,'New Monitor','LG Monitor'),\r\n" + 
				"(6,6,5,500,'Fresh Gold','Gold'),\r\n" + 
				"(7,7,4,780,'Remake of Raphael','Painting'),\r\n" + 
				"(8,8,3,10,'Fresh Onions','Onions'),\r\n" + 
				"(9,9,2,6500,'2012 Toyota Camry','Toyota Camry');";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql2);
		preparedStatement.executeUpdate();
		System.out.println("Shopping Cart created succesfully.");
		connect.close();
	}
	public void createReviewsTable() throws SQLException{
		connect_func();         
		String sql = "create table reviews (\r\n" + 
				"	review_id INT NOT NULL auto_increment,\r\n" + 
				"    score varchar(255),\r\n" + 
				"    short_remark varchar(255),\r\n" + 
				"    review_date varchar(255),\r\n" + 
				"    userR_id INT,\r\n" + 
				"    itemR_id INT,\r\n" + 
				"    PRIMARY KEY (review_id),\r\n" + 
				"    constraint userR_id\r\n" + 
				"    foreign key (userR_id)\r\n" + 
				"    references projectdb.users(user_id),\r\n" + 
				"    constraint itemR_id\r\n" + 
				"    foreign key (itemR_id)\r\n" + 
				"    references projectdb.items(item_id)\r\n" + 
				");";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.executeUpdate();
		
		String sql2 = "insert into reviews (review_id,score,short_remark,review_date,userR_id,itemR_id)\r\n" + 
				"values (1,'Fair','Fair Condition','12/16/2018',5,4),\r\n" + 
				"(2,'Good','Good Condition','10/12/2019',8,7),\r\n" + 
				"(3,'Excellent','Excellent Condition','11/27/2019',2,10),\r\n" + 
				"(4,'Excellent','Excellent Condition','01/01/2019',10,2),\r\n" + 
				"(5,'Poor','Poor Condition','06/12/2019',6,3),\r\n" + 
				"(6,'Fair','Fair Condition','04/12/2017',7,1),\r\n" + 
				"(7, 'Good','Good Conditon','12/18/2018',9,5),\r\n" + 
				"(8,'Excellent','Excellent Condition','10/12/2019',3,9),\r\n" + 
				"(9,'Excellent','Excellent Condition','01/01/2019',5,6),\r\n" + 
				"(10,'Poor','Poor Condition','12/16/2018',4,8);";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql2);
		preparedStatement.executeUpdate();
		System.out.println("Reviews created succesfully.");
		connect.close();
		
	}
	public void createFavoriteItemsTable() throws SQLException{
		connect_func();         
		String sql = "create table favoriteItems(\r\n" + 
				"	fav_id INT NOT NULL auto_increment,\r\n" + 
				"    userF_id INT,\r\n" + 
				"    itemF_id INT,\r\n" + 
				"    price varchar(255),\r\n" + 
				"    title varchar(255),\r\n" + 
				"    dscrp varchar(255),\r\n" + 
				"    PRIMARY KEY (fav_id),\r\n" + 
				"    constraint userF_id\r\n" + 
				"    foreign key(userF_id)\r\n" + 
				"    references projectdb.users(user_id),\r\n" + 
				"    constraint itemF_id\r\n" + 
				"    foreign key(itemF_id)\r\n" + 
				"    references projectdb.items(item_id)\r\n" + 
				");";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.executeUpdate();
		String sql2 = "insert into favoriteItems(fav_id,userF_id,itemF_id,price,title,dscrp)\r\n" + 
				"values (1,7,10,30,'Hammer','Brand new Hammer'),\r\n" + 
				"(2,3,5,250,'LG Monitor','New Monitor'),\r\n" + 
				"(3,5,6,500,'Gold','Fresh Gold'),\r\n" + 
				"(4,6,8,10,'Onions','Fresh Onions'),\r\n" + 
				"(5,4,9,6500,'Toyota Camry','2012 Toyota Camry'),\r\n" + 
				"(6,3,1,1000,'iPhoneX','Brand New IphoneX'),\r\n" + 
				"(7,10,7,780,'Painting','Remake of Raphael'),\r\n" + 
				"(8,9,3,200,'Speaker','Brand New Speaker'),\r\n" + 
				"(9,8,2,3,'Potato','Uneaten Potato'),\r\n" + 
				"(10,2,4,15,'Basketball','Used BasketBall');";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql2);
		preparedStatement.executeUpdate();
		System.out.println("Favorite Items created succesfully.");
		connect.close();
		
	}
	
	public void createFavoriteSellersTable() throws SQLException{
		connect_func();         
		String sql = "create table favoriteSellers(\r\n" + 
				"	favSeller_id INT NOT NULL auto_increment,\r\n" + 
				"    userFS_id INT,\r\n" + 
				"    logUser_id INT,\r\n" + 
				"    username varchar(255),\r\n" + 
				"    first_name varchar(255),\r\n" + 
				"    last_name varchar(255),\r\n" + 
				"    email varchar(255),\r\n" + 
				"    PRIMARY KEY (favSeller_id),\r\n" + 
				"    constraint userFS_id\r\n" + 
				"    foreign key(userFS_id)\r\n" + 
				"    references projectdb.users(user_id),\r\n" + 
				"    constraint logUser_id\r\n" + 
				"    foreign key (logUser_id)\r\n" + 
				"    references projectdb.users(user_id)\r\n" + 
				");";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.executeUpdate();
		String sql2 = "insert into favoriteSellers(favSeller_id,userFS_id,logUser_id,username,first_name,last_name,email)\r\n" + 
				"values (1,10,5, 'AbelTesfaye','Abel','Tesfaye','abel@gmail.com'),\r\n" + 
				"(2,9,6,'LebronJames','Lebron','James','lebron@gmail.com'),\r\n" + 
				"(3,8,4,'KashyapKandi','Kashyap','Kandi','kashyap@gmail.com'),\r\n" + 
				"(4,7,3,'HarshPatel','Harsh','Patel','harsh@gmail.com'),\r\n" + 
				"(5,6,10,'IrfanImthias','Irfan','Imthias','irfan@gmail.com'),\r\n" + 
				"(6,5,2,'ShaunakVaghasia','Shaunak','Vaghasia','shaunak@gmail.com'),\r\n" + 
				"(7,4,8,'ShanRanch','Shan','Ranch','shan@gmail.com'),\r\n" + 
				"(8,3,9,'KateSmith','Kate','Smith','kate@gmail.com'),\r\n" + 
				"(9,2,1,'JohnSmith','John','Smith','john@gmail.com'),\r\n" + 
				"(10,1,7,'admin','admin','admin','admin@admin.com');";
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql2);
		preparedStatement.executeUpdate();
		System.out.println("Favorite Sellers created succesfully.");
		connect.close();
		
	}
	/*public void createExampleTable() throws SQLException{        
		String sql = "CREATE TABLE example (\r\n" + 
				"	 x_id INT,\r\n" + 
				"     x_xrID INT,\r\n" + 
				"	 x_rID INT,\r\n" + 
				"     scorex varchar(255),\r\n" + 
				"     x_remark varchar(1000),\r\n" + 
				"     PRIMARY KEY (x_id)\r\n" + 
				");";
		
		connect_func(); 
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.executeUpdate();
		System.out.println("Reviews created succesfully.");
		connect.close();
	}*/
	
	
	
	
	
	/*public List<AddUsers> listAllUsers() throws SQLException {
        List<AddUsers> listUsers = new ArrayList<AddUsers>();        
        String sql = "SELECT * FROM users";      
        connect_func();      
        statement =  (Statement) connect.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
         
        while (resultSet.next()) {
            int id = resultSet.getInt("user_id");
            int age = resultSet.getInt("age");
            String gender = resultSet.getString("gender");
            String email = resultSet.getString("email");
            String FirstName = resultSet.getString("first_Name");
            String LastName = resultSet.getString("last_Name");
            String user_pswrd = resultSet.getString("user_pswrd");
             
            AddUsers Users = new AddUsers(id, age, gender, email, FirstName, LastName, user_pswrd);
            listUsers.add(Users);
        }        
        resultSet.close();
        statement.close();         
       // disconnect();        
        return listUsers;
    }
	
	public boolean insert(AddUsers users) throws SQLException {
    	connect_func();         
		String sql = "insert into  users(user_id, age, gender, email, first_name, "
				+ "last_name, user_pswrd) VALUES " +
		          "(1, 11, 'Male', 'john@gmail.com', 'John', 'John', 'john1234'), "+
		          "(2, 14, 'Female', 'kate@gmail.com', 'Kate', 'Kate', 'kate1234'), "+
		          "(3, 16, 'Male', 'max@gmail.com', 'Max', 'Max', 'max1234'), "+
		          "(4, 18, 'Male', 'john@gmail.com', 'John', 'John', 'john1234'), "+
		          "(5, 20, 'Female', 'john@gmail.com', 'John', 'John', 'john1234'), "+
		          "(6, 11, 'Male', 'john@gmail.com', 'John', 'John', 'john1234'),, "+
		          "(7, 11, 'Male', 'john@gmail.com', 'John', 'John', 'john1234'),, "+
		          "(8, 11, 'Male', 'john@gmail.com', 'John', 'John', 'john1234'),, "+
		          "(9, 11, 'Male', 'john@gmail.com', 'John', 'John', 'john1234'),, "+
		          "(10, 11, 'Male', 'john@gmail.com', 'John', 'John', 'john1234'), ";
//		preparedStatement.executeUpdate();
		
        boolean rowInserted = preparedStatement.executeUpdate(sql) > 0;
        preparedStatement.close();
//        disconnect();
        return rowInserted;
    }    */ 
	
	///**
	 //* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 //*/
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		_DBConn = new DBConn();
		try {
			createUsersTable();
			createItemsTable();
			createShoppingCartTable();
			createReviewsTable();
			createFavoriteItemsTable();
			createFavoriteSellersTable();
			
		}catch (Exception e) {
			System.out.println(e);
		}
	}

	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }
	
	
	/*public AddUsers getUsers(int id) throws SQLException {
    	AddUsers people = null;
        String sql = "SELECT * FROM users WHERE id = ?";
         
        connect_func();
         
        preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
        preparedStatement.setInt(1, id);
         
        ResultSet resultSet = preparedStatement.executeQuery();
         
        if (resultSet.next()) {
             int age = resultSet.getInt("age");
             String gender = resultSet.getString("gender");
             String email = resultSet.getString("email");
             String FirstName = resultSet.getString("first_Name");
             String LastName = resultSet.getString("last_Name");
             String user_pswrd = resultSet.getString("user_pswrd");
             AddUsers Users = new AddUsers(id, age, gender, email, FirstName, LastName, user_pswrd);
        }
         
        resultSet.close();
        statement.close();
         
        return people;
    }*/
}
