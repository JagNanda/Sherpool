package DAO;

import java.io.Serializable;
import Util.CarPoolDBUtil;
import Model.StudentBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class StudentDao implements Serializable{
	private static final long serialVersionUID = 1L;

	Connection conn = null;
	
	//add a driver to the database
	//return false if student was not added
	//return true if they were
	public boolean addStudent(StudentBean student) 
	{
		try
		{
			conn = CarPoolDBUtil.getConnection();
			String addSql = "INSERT INTO Users" + "(StudentID,Password,FirstName,LastName,Email,Phone)"
					+ "VALUES (?,?,?,?,?,?)";

			PreparedStatement pStmt = conn.prepareStatement(addSql);
			pStmt.setInt(1, student.getStudentID());
			pStmt.setString(2, student.getPassword());
			pStmt.setString(3, student.getFirstName());
			pStmt.setString(4, student.getLastName());
			pStmt.setString(5, student.getEmail());
			pStmt.setLong(6, student.getPhone());
			pStmt.executeUpdate();
		}
		catch (SQLException e) 
		{
			System.out.println("ERROR: Duplicate Id entered for registration");
			return false;
		} 
		finally 
		{
			CarPoolDBUtil.closeConnection();
		}
		return true;
	}

	public StudentBean getUserByID(int id) {
		StudentBean student = new StudentBean();
		try {
			conn = CarPoolDBUtil.getConnection();
			String selectSql = "SELECT * FROM Users WHERE StudentID =?";
			PreparedStatement pStmt = conn.prepareStatement(selectSql);

			pStmt.setInt(1, id);

			ResultSet rs = pStmt.executeQuery();
			if (rs.next()) {
				student.setStudentID(Integer.parseInt(rs.getString("StudentID")));
				student.setPassword(rs.getString("Password"));
				student.setFirstName(rs.getString("FirstName"));
				student.setLastName(rs.getString("LastName"));
				student.setEmail(rs.getString("Email"));
				student.setPhone(Long.parseLong(rs.getString("Phone")));
				student.setDate(rs.getTimestamp("DateRegistered"));
				student.setDriver(rs.getBoolean("Driver"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CarPoolDBUtil.closeConnection();
		}

		return student;
	}
}


