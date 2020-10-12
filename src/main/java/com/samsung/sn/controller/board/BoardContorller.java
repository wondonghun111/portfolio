package com.samsung.sn.controller.board;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.samsung.sn.service.board.IBoardService;

@Controller
public class BoardContorller {
	@Autowired
	@Inject
	private IBoardService boardService;

}
