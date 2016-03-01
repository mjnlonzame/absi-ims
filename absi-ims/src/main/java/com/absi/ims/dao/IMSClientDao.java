package com.absi.ims.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.absi.ims.domain.IMSClient;

@Transactional
public interface IMSClientDao extends JpaRepository<IMSClient, Long> {

	@Query("SELECT c from IMSClient c join c.outlets o where o.id=:id" )
	public List<IMSClient> retrieveClientByOutletId(@Param("id") Long id);
}
