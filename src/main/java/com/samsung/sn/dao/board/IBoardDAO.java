package com.samsung.sn.dao.board;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class IBoardDAO {
	
	@Inject
	private SqlSession sqlsession;
}
