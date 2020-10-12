package com.samsung.sn.dto.board;

import org.springframework.stereotype.Component;

@Component
public class BoardDTO {
		
		private String title;
		private String contect;
		private String writer;
		
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContect() {
			return contect;
		}
		public void setContect(String contect) {
			this.contect = contect;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		
}
