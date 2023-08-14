package projectManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projectManagement.model.Student;

public class studentDAO {

	private static final String INSERT_STUDENT_SQL = "INSERT INTO students"
			+ "(StudentID,FirstName, LastName, Email,Department,BatchYear, ContactNumber) VALUES " + " (?, ?, ?, ?, ?, ?, ?);";
	private static final String SELECT_STUDENT_BY_ID = "select * from students where StudentID = ?";
	private static final String SELECT_ALL_STUDENTS = "select * from students";
	private static final String DELETE_STUDENT_SQL = "delete from students where StudentID = ? ";
	private static final String UPDATE_STUDENT_SQL = "update students set FirstName= ?, LastName =?, Email = ?, Department = ?, BatchYear = ?, ContactNumber = ? where  StudentID = ?;";

	SqlConnection sqlconnection = new SqlConnection();

	public void insertStudent(Student student) throws SQLException {
		System.out.println(INSERT_STUDENT_SQL);

		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STUDENT_SQL)) {
			preparedStatement.setString(1, student.getStudentID());
			preparedStatement.setString(2, student.getFirstName());
			preparedStatement.setString(3, student.getLastName());
			preparedStatement.setString(4, student.getEmail());
			preparedStatement.setString(5, student.getDepartment());
			preparedStatement.setInt(6, student.getBatch());
			preparedStatement.setString(7, student.getContactNumber());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Student selectStudent(String studentID) {
		Student student = null;

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_BY_ID);) {
			preparedStatement.setString(1, studentID);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String FirstName = rs.getString("FirstName");
				String LastName = rs.getString("LastName");
				String Email = rs.getString("Email");
				String Department = rs.getString("Department");
				int BatchYear = rs.getInt("BatchYear");
				String ContactNumber = rs.getString("ContactNumber");
				student = new Student(studentID, FirstName, LastName, Email, Department, BatchYear, ContactNumber);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return student;
	}

	public List<Student> selectAllStudents() {

		List<Student> students = new ArrayList<>();

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STUDENTS);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String StudentID = rs.getString("StudentID");
				String FirstName = rs.getString("FirstName");
				String LastName = rs.getString("LastName");
				String Email = rs.getString("Email");
				String Department = rs.getString("Department");
				int BatchYear = rs.getInt("BatchYear");
				String ContactNumber = rs.getString("ContactNumber");
				students.add(new Student(StudentID, FirstName, LastName, Email, Department, BatchYear, ContactNumber));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return students;
	}

	public boolean deleteStudent(String studentID) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_STUDENT_SQL);) {
			statement.setString(1, studentID);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateStudent(Student student) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement statement = connection.prepareStatement(UPDATE_STUDENT_SQL);) {
			System.out.println("updated Student: " + statement);

			statement.setString(1, student.getFirstName());
			statement.setString(2, student.getLastName());
			statement.setString(3, student.getEmail());
			statement.setString(4, student.getDepartment());
			statement.setInt(5, student.getBatch());
			statement.setString(6, student.getContactNumber());
			statement.setString(7, student.getStudentID());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
