package com.websystique.springmvc.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.websystique.springmvc.pojos.User;

public abstract interface UsersRepository extends CrudRepository<User, Integer> {
	@Query("FROM User b WHERE b.uuid = :uuid ")
	public User checkExistanceOfUUID(@Param("uuid") String uuid);

	@Query("FROM User b WHERE b.email = :email and b.password=:password")
	public User login(@Param("email") String email, @Param("password") String password);

	@Query("FROM User b WHERE b.uuid = :uuid")
	public User getUserDetails(@Param("uuid") String email);

	@Query("FROM User b WHERE b.branch.uuid = :uuid and b.role.roleName = :role")
	public List<User> getUserListByBranchID(@Param("uuid") String uuid, @Param("role") String role);

	@Query("FROM User b WHERE b.isDeleted = 0 ")
	public List<User> loadAllNonDeletedUsers();

	@Query("FROM User b WHERE b.isDeleted = 1 ")
	public List<User> loadAllDeletedUsers();

	@Query("FROM User b WHERE b.email = :email")
	public User checkEmailExisted(@Param("email") String email);

	@Query("FROM User b WHERE b.email = :email and b.status.status = 'INACTIVE'")
	public User getUserByEmailAndStatus(@Param("email") String email);

}
