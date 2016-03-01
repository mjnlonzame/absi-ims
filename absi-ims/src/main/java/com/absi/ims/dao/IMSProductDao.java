package com.absi.ims.dao;

import java.util.List;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.absi.ims.domain.IMSProduct;

@Transactional
public interface IMSProductDao extends CrudRepository<IMSProduct, Long> {

	//@Query("FROM IMSProduct where id=:id")
	@Query("SELECT p from IMSProduct p join p.client c where c.id=:id")
	public List<IMSProduct> retrieveProductByClientId(@Param("id") Long id);
	
	//public IMSProduct retrieveProductByDate;
}
