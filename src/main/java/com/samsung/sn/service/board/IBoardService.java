package com.samsung.sn.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.samsung.sn.dao.board.IBoardDAO;

@Service
public class IBoardService {
	@Autowired
	private IBoardDAO boardDao;
}
