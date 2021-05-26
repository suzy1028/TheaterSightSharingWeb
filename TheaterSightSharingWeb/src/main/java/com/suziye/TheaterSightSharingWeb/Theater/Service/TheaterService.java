package com.suziye.TheaterSightSharingWeb.Theater.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.suziye.TheaterSightSharingWeb.Theater.Theater;
import com.suziye.TheaterSightSharingWeb.Theater.Dao.TheaterDao;
import com.suziye.TheaterSightSharingWeb.Theater.Impl.TheaterImpl;
import com.suziye.TheaterSightSharingWeb.Theater.Vo.TheaterVo;

@Service
public class TheaterService implements ITheaterService{

	@Autowired
	private TheaterImpl dao;

	@Override
	@Transactional
	public List<TheaterVo> getTheaterList() throws Exception {
		return dao.selectTheaterList();
	}

}
