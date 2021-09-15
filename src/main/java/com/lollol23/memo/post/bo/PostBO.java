package com.lollol23.memo.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lollol23.memo.post.dao.PostDAO;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	public int addPost(int userId, String subject, String content) {
		return postDAO.insertPost(userId, subject, content);
	}
}
