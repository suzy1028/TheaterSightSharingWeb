package com.suziye.TheaterSightSharingWeb.Theater.Service;

import java.util.List;

import com.suziye.TheaterSightSharingWeb.Theater.Vo.TheaterVo;

public interface ITheaterService {
	List<TheaterVo> getTheaterList() throws Exception;
}
