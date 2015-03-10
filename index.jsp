<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>Bank Application</title>
    
	
  </head>
  <body>
<% 
	String funcID = request.getParameter("funcID");
	String cid = request.getParameter("cid");
	String cid2 = request.getParameter("cid2");
	String ano = request.getParameter("ano");
	String bla = request.getParameter("bla");
	String lno = request.getParameter("lno");
	String amo = request.getParameter("amo");
	String cid3 = request.getParameter("cid3");
	String name = request.getParameter("name");
	String street = request.getParameter("street");
	String city = request.getParameter("city");
	String ano2 = request.getParameter("ano2");
	String lno2 = request.getParameter("lno2");
	String cid4 = request.getParameter("cid4");
	String name2 = request.getParameter("name2");
	String city2 = request.getParameter("city2");
	String ano3 = request.getParameter("ano3");
	String lno3 = request.getParameter("lno3");
	String name4 = request.getParameter("name4");
	String street4 = request.getParameter("street4");
	String city4 = request.getParameter("city4");
	String name5 = request.getParameter("name5");
	String street5 = request.getParameter("street5");
	String city5 = request.getParameter("city5");
%>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	}
	catch(Exception e)
	{
		out.println("can't load mysql driver");
		out.println(e.toString());
	}
%>

<b>1. List all the customers:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="1">
    		<input type="submit" value="GO!"/>
</form>

<b>2. List all the accounts:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="2">
			<input type="submit" value="GO!"/>
</form>

<b>3. List all the loans:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="3">
			<input type="submit" value="GO!"/>
</form>

<b>4. Add a new depositor:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="4">
		Customer name: <input name="name4" type="text">
		Street: <input name="street4" type="text">
		City: <input name="city4" type="text">
    		<input type="submit" value="Add"/>
</form>

<b>5. Add a new borrower:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="5">
		Customer name: <input name="name5" type="text">
		Street: <input name="street5" type="text">
		City: <input name="city5" type="text">
    		<input type="submit" value="Add"/>
</form>

<b>6. Modify the balance of an account:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="6">
		Account NO: <input name="ano" type="text">
		Balance: <input name="bla" type="text">
    		<input type="submit" value="Modify"/>
</form>

<b>7. Modify the amount of a loan:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="7">
		Loan NO: <input name="lno" type="text">
		Amount: <input name="amo" type="text">
    		<input type="submit" value="Modify"/>
</form>

<b>8. Modify the personal data of a customer:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="8">
		Customer ID: <input name="cid3" type="text">
		Customer name: <input name="name" type="text">
		Street: <input name="street" type="text">
		City: <input name="city" type="text">
    		<input type="submit" value="Modify"/>
</form>

<b>9. Delete an account:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="9">
		Account NO: <input name="ano2" type="text">
    		<input type="submit" value="Delete"/>
</form>

<b>10. Delete an loan:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="10">
		Loan NO: <input name="lno2" type="text">
    		<input type="submit" value="Delete"/>
</form>

<b>11. Given a customer_id, show all the related accounts and loans:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="11">
		Customer ID: <input name="cid4" type="text">
    		<input type="submit" value="Submit"/>
</form>

<b>12. Find customers by name:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="12">
		Name: <input name="name2" type="text">
    		<input type="submit" value="Submit"/>
</form>

<b>13. Given a city, show all customers in that city:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="13">
		City: <input name="city2" type="text">
    		<input type="submit" value="Submit"/>
</form>

<b>14. Find owners of an account by using account_id:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="14">
		Account NO: <input name="ano3" type="text">
    		<input type="submit" value="Submit"/>
</form>

<b>15. Find owners of a loan by loan_id:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="15">
		Loan NO: <input name="lno3" type="text">
    		<input type="submit" value="Submit"/>
</form>
<% if(funcID!=null) {				
	try {
		String url="jdbc:mysql://127.0.0.1:3306/bank";
		String id="bank";
		String pwd="eecs118"; 
		Connection con= DriverManager.getConnection(url,id,pwd); 
	
		int func=Integer.valueOf(funcID);
		Statement stmt;
		Statement stmtt;
		PreparedStatement pstmt;
		PreparedStatement pstmtt;
		ResultSet rs;
		ResultSet rss;
		switch(func) {
			case 1:
				stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
				String sql1="SELECT * FROM customer";
				rs=stmt.executeQuery(sql1); // Result set get the result of the SQL query
				out.println("<table border=\"1\">");
				out.println("<caption> Customer List </caption>");
				out.println("<tr>");
				out.println("<th>ID</th>");
				out.println("<th>Name</th>");
				out.println("<th>Street</th>");
				out.println("<th>City</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("customer_id")+"</td>");
					out.println("<td>"+rs.getString("customer_name")+"</td>");
					out.println("<td>"+rs.getString("customer_street")+"</td>");
					out.println("<td>"+rs.getString("customer_city")+"</td>");
					out.println("</tr>");
				}
				rs.close();
				stmt.close();
				out.println("</table>");
				break;
			case 2:
				stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
				String sql2="SELECT * FROM account";
				rs=stmt.executeQuery(sql2); // Result set get the result of the SQL query
				out.println("<table border=\"1\">");
				out.println("<caption> Account List </caption>");
				out.println("<tr>");
				out.println("<th>account_no</th>");
				out.println("<th>balance</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("account_no")+"</td>");
					out.println("<td>"+rs.getString("balance")+"</td>");
					out.println("</tr>");
				}
				rs.close();
				stmt.close();
				out.println("</table>");
				break;
			case 3:
				stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
				String sql3="SELECT * FROM loan";
				rs=stmt.executeQuery(sql3); // Result set get the result of the SQL query
				out.println("<table border=\"1\">");
				out.println("<caption> Loan List </caption>");
				out.println("<tr>");
				out.println("<th>loan_no</th>");
				out.println("<th>amount</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("loan_no")+"</td>");
					out.println("<td>"+rs.getString("amount")+"</td>");
					out.println("</tr>");
				}
				rs.close();
				stmt.close();
				out.println("</table>");
				break;
			case 4:
				pstmt = con.prepareStatement("insert into customer values (default,?,?,?)",Statement.RETURN_GENERATED_KEYS);
				pstmt.clearParameters();
				pstmt.setString(1, name4);
				pstmt.setString(2, street4);
				pstmt.setString(3, city4);
				pstmt.executeUpdate();
				rs=pstmt.getGeneratedKeys();
				int id4 = -1;
				while (rs.next()) {
					id4 = rs.getInt(1);
					out.println("Successfully added. Customer_ID:"+id4+"\t"+"<br />");
				}
				rs.close();
				pstmt.close();
			    String sql4 = "insert into account values (default,0)" ;
				stmt = con.createStatement();
				stmt.executeUpdate(sql4, Statement.RETURN_GENERATED_KEYS);
				rs=stmt.getGeneratedKeys();
				int no4 = -1;
				if(rs.next()){
					no4 = rs.getInt(1);
					out.println("Successfully added a new account. Account number:"+no4 +"\t");
				}
				stmt.close();
				
				String sql41 = "insert into depositor values (?,?)";
				pstmtt = con.prepareStatement(sql41);
				pstmtt.clearParameters();
				pstmtt.setInt(1,id4);
				pstmtt.setInt(2,no4);
				pstmtt.executeUpdate();
				pstmtt.close();
				break;
			case 5:
			    pstmt = con.prepareStatement("insert into customer values (default,?,?,?)",Statement.RETURN_GENERATED_KEYS);
				pstmt.clearParameters();
				pstmt.setString(1, name5);
				pstmt.setString(2, street5);
				pstmt.setString(3, city5);
				pstmt.executeUpdate();
				rs=pstmt.getGeneratedKeys();
				int id5 = -1;
				while (rs.next()) {
					id5 = rs.getInt(1);
					out.println("Successfully added. Customer_ID:"+id5+"\t"+"<br />");
				}
				rs.close();
				pstmt.close();
			    String sql5 = "insert into loan values (default,0)" ;
				stmt = con.createStatement();
				stmt.executeUpdate(sql5, Statement.RETURN_GENERATED_KEYS);
				rs=stmt.getGeneratedKeys();
				int no5 = -1;
				if(rs.next()){
					no5 = rs.getInt(1);
					out.println("Successfully added a new loan. Loan number:"+no5 +"\t");
				}
				stmt.close();
				
				String sql51 = "insert into borrower values (?,?)";
				pstmtt = con.prepareStatement(sql51);
				pstmtt.clearParameters();
				pstmtt.setInt(1,id5);
				pstmtt.setInt(2,no5);
				pstmtt.executeUpdate();
				pstmtt.close();
				break;
			case 6:
			    String sql6 = "update account  set balance = ?  where account_no = ?";
				pstmt = con.prepareStatement(sql6);
				pstmt.setString(1, bla);
				pstmt.setString(2, ano);
				pstmt.executeUpdate();
				out.println("Account No."+ano+" Modified \t");
				pstmt.close();
				break;
			case 7:
			    String sql7 = "update loan  set amount = ?  where loan_no = ?";
				pstmt = con.prepareStatement(sql7);
				pstmt.setString(1, amo);
				pstmt.setString(2, lno);
				pstmt.executeUpdate();
				out.println("Loan No."+lno+" Modified \t");
				pstmt.close();
				break;
			case 8:
			    String sql8 = "update customer  set customer_name = ?, customer_street = ?, customer_city = ? where customer_id = ?";
				pstmt = con.prepareStatement(sql8);
				pstmt.setString(1, name);
				pstmt.setString(2, street);
				pstmt.setString(3, city);
				pstmt.setString(4, cid3);
				pstmt.executeUpdate();
				out.println("Customer ID:"+cid3+" Information Modified \t");
				pstmt.close();
				break;
			case 9:
			    String sql9 = "delete from depositor  where account_no = ?";
				pstmt = con.prepareStatement(sql9);
				pstmt.setString(1, ano2);
				pstmt.executeUpdate();
				String sql91 = "delete from account  where account_no = ?";
				pstmtt = con.prepareStatement(sql91);
				pstmtt.setString(1, ano2);
				pstmtt.executeUpdate();
				out.println("Account No."+ano2+" Deleted \t");
				pstmt.close();
				break;
			case 10:
			    String sql10 = "delete from borrower  where loan_no = ?";
				pstmt = con.prepareStatement(sql10);
				pstmt.setString(1, lno2);
				pstmt.executeUpdate();
				String sql101 = "delete from loan  where loan_no = ?";
				pstmtt = con.prepareStatement(sql101);
				pstmtt.setString(1, lno2);
				pstmtt.executeUpdate();
				out.println("Loan No."+lno2+" Deleted \t");
				pstmt.close();
				break;
			case 11:
				String sql11="SELECT account.account_no, account.balance FROM depositor, account WHERE depositor.account_no = account.account_no and depositor.customer_id = ?";
				pstmt = con.prepareStatement(sql11);
				pstmt.setString(1, cid4);
				rs = pstmt.executeQuery();
				out.println("<table border=\"1\">");
				out.println("<caption> Account List </caption>");
				out.println("<tr>");
				out.println("<th>account_no</th>");
				out.println("<th>balance</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("account_no")+"</td>");
					out.println("<td>"+rs.getString("balance")+"</td>");
					out.println("</tr>");
				}
				rs.close();
				pstmt.close();
				out.println("</table>");
				String sql111="SELECT loan.loan_no, loan.amount FROM borrower, loan WHERE borrower.loan_no = loan.loan_no and borrower.customer_id = ?";
				pstmtt = con.prepareStatement(sql111);
				pstmtt.setString(1, cid4);
				rss = pstmtt.executeQuery();
				out.println("<table border=\"1\">");
				out.println("<caption> Loan List </caption>");
				out.println("<tr>");
				out.println("<th>loan_no</th>");
				out.println("<th>amount</th>");
				out.println("</tr>");
				while (rss.next()) {
					out.println("<tr>");
					out.println("<td>"+rss.getString("loan_no")+"</td>");
					out.println("<td>"+rss.getString("amount")+"</td>");
					out.println("</tr>");
				}
				rss.close();
				pstmtt.close();
				out.println("</table>");
				break;
			case 12:
			    String sql12="SELECT * FROM customer WHERE customer.customer_name = ?";
				pstmt = con.prepareStatement(sql12);
				pstmt.setString(1, name2);
				rs = pstmt.executeQuery();
				out.println("<table border=\"1\">");
				out.println("<caption> Customer </caption>");
				out.println("<tr>");
				out.println("<th>ID</th>");
				out.println("<th>Name</th>");
				out.println("<th>Street</th>");
				out.println("<th>City</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("customer_id")+"</td>");
					out.println("<td>"+rs.getString("customer_name")+"</td>");
					out.println("<td>"+rs.getString("customer_street")+"</td>");
					out.println("<td>"+rs.getString("customer_city")+"</td>");
					out.println("</tr>");
				}
				rs.close();
				pstmt.close();
				out.println("</table>");
				break;
			case 13:
			    String sql13="SELECT * FROM customer WHERE customer.customer_city = ?";
				pstmt = con.prepareStatement(sql13);
				pstmt.setString(1, city2);
				rs = pstmt.executeQuery();
				out.println("<table border=\"1\">");
				out.println("<caption> Customer </caption>");
				out.println("<tr>");
				out.println("<th>ID</th>");
				out.println("<th>Name</th>");
				out.println("<th>Street</th>");
				out.println("<th>City</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("customer_id")+"</td>");
					out.println("<td>"+rs.getString("customer_name")+"</td>");
					out.println("<td>"+rs.getString("customer_street")+"</td>");
					out.println("<td>"+rs.getString("customer_city")+"</td>");
					out.println("</tr>");
				}
				rs.close();
				pstmt.close();
				out.println("</table>");
				break;
			case 14:
			    String sql14="SELECT depositor.customer_id, customer.customer_name FROM depositor, customer WHERE depositor.customer_id = customer.customer_id and depositor.account_no = ?";
				pstmt = con.prepareStatement(sql14);
				pstmt.setString(1, ano3);
				rs = pstmt.executeQuery();
				out.println("<table border=\"1\">");
				out.println("<caption> Customer </caption>");
				out.println("<tr>");
				out.println("<th>ID</th>");
				out.println("<th>Name</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("customer_id")+"</td>");
					out.println("<td>"+rs.getString("customer_name")+"</td>");
					out.println("</tr>");
				}
				rs.close();
				pstmt.close();
				out.println("</table>");
				break;
			case 15:
			    String sql15="SELECT borrower.customer_id, customer.customer_name FROM borrower, customer WHERE borrower.customer_id = customer.customer_id and borrower.loan_no = ?";
				pstmt = con.prepareStatement(sql15);
				pstmt.setString(1, lno3);
				rs = pstmt.executeQuery();
				out.println("<table border=\"1\">");
				out.println("<caption> Customer </caption>");
				out.println("<tr>");
				out.println("<th>ID</th>");
				out.println("<th>Name</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("customer_id")+"</td>");
					out.println("<td>"+rs.getString("customer_name")+"</td>");
					out.println("</tr>");
				}
				rs.close();
				pstmt.close();
				out.println("</table>");
				break;
		}
		con.close();
	}
	catch(Exception e)
	{
			out.println(e.toString());
	} 	
	
} %>


  
  </body>
</html>
