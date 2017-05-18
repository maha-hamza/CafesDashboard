package com.websystique.springmvc.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.UserLoginHistory;

public abstract interface UserLoginHistoryRepository
		extends JpaRepository<UserLoginHistory, Long>, JpaSpecificationExecutor<UserLoginHistory> {

	@Query("FROM UserLoginHistory sess WHERE sess.userSessionId = :sessionId ")
	public UserLoginHistory getUserLoginHistory(@Param("sessionId") String id);
}
