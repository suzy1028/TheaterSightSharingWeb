package com.suziye.TheaterSightSharingWeb.Theater.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.suziye.TheaterSightSharingWeb.Theater.Theater;

@Repository
public class TheaterDao implements ITheaterDao {

	private JdbcTemplate template;

	@Autowired
	public TheaterDao(ComboPooledDataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Theater> selectAll() {
		List<Theater> theaters = null;

		final String sql = "SELECT * FROM theater";

		theaters = template.query(sql, new RowMapper<Theater>() {

			@Override
			public Theater mapRow(ResultSet rs, int rowNum) throws SQLException {
				Theater theater = new Theater();
				theater.setTheater_id(rs.getString("theater_id"));
				theater.setTheater_lat(rs.getString("theater_lat"));
				theater.setTheater_lon(rs.getString("theater_lon"));
				theater.setAddress(rs.getString("Address"));
				theater.setSeats(rs.getInt("seats"));
				System.out.println(rs.getString("theater_id"));
				return theater;
			}
		});

		if (theaters.isEmpty())
			return null;

		return theaters;
		
	}

	

}
