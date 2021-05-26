package com.suziye.TheaterSightSharingWeb.Theater.Impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suziye.TheaterSightSharingWeb.Theater.Dao.ITheaterDao;
import com.suziye.TheaterSightSharingWeb.Theater.Dao.TheaterDao;
import com.suziye.TheaterSightSharingWeb.Theater.Vo.TheaterVo;

@Repository
public class TheaterImpl extends TheaterDao implements ITheaterDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<TheaterVo> selectTheaterList() throws Exception {
		List<TheaterVo> getSelectList=sqlSession.selectList("mapper.Theater_sql.selectTheaterList");
		return getSelectList;
	}



}
