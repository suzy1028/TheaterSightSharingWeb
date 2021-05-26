package com.suziye.TheaterSightSharingWeb.Theater.Dao;

import java.util.List;

import com.suziye.TheaterSightSharingWeb.Theater.Vo.TheaterVo;

public interface ITheaterDao {
	List<TheaterVo> selectTheaterList() throws Exception;

}
