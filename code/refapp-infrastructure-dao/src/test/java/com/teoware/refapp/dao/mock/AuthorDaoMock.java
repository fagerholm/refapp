package com.teoware.refapp.dao.mock;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.teoware.refapp.dao.AuthorDaoBean;

public class AuthorDaoMock extends AuthorDaoBean {

	private static final long serialVersionUID = 1L;

	public AuthorDaoMock(Connection connection) {
		super.connection = connection;
	}

	@Override
	protected Connection createOrReuseConnection() throws SQLException {
		return super.connection;
	}

	@Override
	protected void closeConnection(PreparedStatement statement, boolean persistConnection) {
		try {
			statement.close();
		} catch (SQLException e) {
			// Ignore
		}
	}

	public void closeAll() throws SQLException {
		if (super.connection != null) {
			super.connection.close();
		}
	}
}
