package com.lollol23.memo.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {
	
	
	public int insertPost(
			@Param("userID") int userId
			, @Param("subject") String subject
			, @Param("content") String content
			); 
}
