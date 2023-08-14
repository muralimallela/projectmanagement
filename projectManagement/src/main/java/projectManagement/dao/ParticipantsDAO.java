package projectManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projectManagement.model.Participants;

public class ParticipantsDAO {

	public ParticipantsDAO() {

	}

	private static final String INSERT_PARTICIPANT_SQL = "INSERT INTO participants"
			+ "(participantID,projectID, studentID, role) VALUES " + " (?, ?, ?, ?);";
	private static final String SELECT_PARTICIPANT_BY_ID = "select * from participants where participantID = ?";
	private static final String SELECT_ALL_PARTICIPANTS = "select * from participants";
	private static final String DELETE_PARTICIPANT_SQL = "delete from participants where participantID = ?;";
	private static final String UPDATE_PARTICIPANT_SQL = "update participants set projectID= ?, studentID =?, role = ? where  participantID = ?;";

	SqlConnection sqlconnection = new SqlConnection();

	public void insertProject(Participants participants) throws SQLException {
		System.out.println(INSERT_PARTICIPANT_SQL);

		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PARTICIPANT_SQL)) {
			preparedStatement.setString(1, participants.getParticipantID());
			preparedStatement.setString(2, participants.getProjectID());
			preparedStatement.setString(3, participants.getStudentID());
			preparedStatement.setString(4, participants.getRole());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Participants selectParticipant(String participantID) {
		Participants participant = null;

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PARTICIPANT_BY_ID);) {
			preparedStatement.setString(1, participantID);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String projectID = rs.getString("projectID");
				String studentID = rs.getString("studentID");
				String role = rs.getString("role");
				participant = new Participants(participantID, projectID, studentID, role);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return participant;
	}

	public List<Participants> selectAllParticipants() {

		List<Participants> participants = new ArrayList<>();

		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PARTICIPANTS);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String participantID = rs.getString("participantID");
				String projectID = rs.getString("projectID");
				String studentID = rs.getString("studentID");
				String role = rs.getString("role");
				participants.add(new Participants(participantID, projectID, studentID, role));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return participants;
	}

	public boolean deleteParticipant(String participantID) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = sqlconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_PARTICIPANT_SQL);) {
			statement.setString(1, participantID);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateParticipant(Participants participant) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = sqlconnection.getConnection();

				PreparedStatement statement = connection.prepareStatement(UPDATE_PARTICIPANT_SQL);) {
			System.out.println("updated Project: " + statement);

			statement.setString(1, participant.getParticipantID());
			statement.setString(2, participant.getProjectID());
			statement.setString(3, participant.getStudentID());
			statement.setString(4, participant.getRole());
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
