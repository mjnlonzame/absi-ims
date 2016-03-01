package com.absi.ims.dao;

import java.util.Date;
import java.util.List;

//import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.absi.ims.domain.IMSInventory;
@Transactional
public interface IMSInventoryDao extends CrudRepository<IMSInventory, Long>{

	@Query("SELECT i FROM IMSInventory i join i.product p where i.period=:period AND p.id=:productId")
	IMSInventory retrieveInventoryByProductId(@Param("productId") Long productId, @Param("period") Date period);
		
	@Query("SELECT i FROM IMSInventory i join i.product p where i.period in :periods AND p.id=:productId")
	List<IMSInventory> retrieveInventoriesByProductId(@Param("productId") Long productId, @Param("periods") List<Date> periods);	
	
	@Query("SELECT i FROM IMSInventory i join i.client c where c.id=:clientId AND i.period=:period")
	IMSInventory retrieveInventory(@Param("clientId") Long clientId, @Param("period") Date period);
	
	@Query("SELECT i FROM IMSInventory i join i.client c where c.id=:clientId AND i.startPeriod =:startPeriod AND i.endPeriod =:endPeriod ")
	List<IMSInventory> retrieveInventories(@Param("clientId") Long clientId,  @Param("startPeriod") Date startPeriod, @Param("endPeriod") Date endPeriod);	
	
}
