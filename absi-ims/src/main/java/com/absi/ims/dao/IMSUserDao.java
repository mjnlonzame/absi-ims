package com.absi.ims.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.absi.ims.domain.IMSProduct;
import com.absi.ims.domain.IMSUser;

@Transactional
public interface IMSUserDao extends CrudRepository<IMSUser, Long> {
	@Query("SELECT u FROM IMSUser u WHERE u.username=:username")
	public IMSUser getIMSUserByUsername(@Param("username") String username);
}