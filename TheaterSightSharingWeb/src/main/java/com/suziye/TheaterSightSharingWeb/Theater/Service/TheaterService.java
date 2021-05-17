package com.suziye.TheaterSightSharingWeb.Theater.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suziye.TheaterSightSharingWeb.Theater.Theater;
import com.suziye.TheaterSightSharingWeb.Theater.Dao.TheaterDao;

@Service
public class TheaterService implements ITheaterService{

	@Autowired
	TheaterDao dao;
	
	@Override
	public List<Theater> theaterGetList() {
		
		List<Theater> theaters;
		theaters=dao.selectAll();
		
		return theaters;
	}

}
