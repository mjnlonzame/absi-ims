package com.absi.ims.dao;



import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.absi.ims.domain.IMSOutlet;

@Transactional
public interface IMSOutletDao extends CrudRepository<IMSOutlet, Long> {

	@Query("SELECT o from IMSOutlet o join o.clients c where c.id=:id")
	public List<IMSOutlet> retrieveOutletByClientId(@Param("id") Long id);
}
