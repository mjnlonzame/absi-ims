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

	@Query("SELECT i FROM IMSInventory i join i.product p join i.outlet o where i.period=:period AND p.id=:productId AND o.id=:outletId")
	IMSInventory retrieveInventoryByProductId(@Param("productId") Long productId, @Param("outletId") Long outletId, @Param("period") Date period);
		
	@Query("SELECT i FROM IMSInventory i join i.product p join i.outlet o where i.period in :periods AND p.id=:productId AND o.id=:outletId")
	List<IMSInventory> retrieveInventoriesByProductId(@Param("productId") Long productId, @Param("outletId") Long outletId, @Param("periods") List<Date> periods);	
	
	@Query("SELECT i FROM IMSInventory i join i.client c join i.outlet o where c.id=:clientId AND i.period=:period ORDER BY o.id")
	List<IMSInventory> retrieveDailyInventories(@Param("clientId") Long clientId, @Param("period") Date period);
	
	@Query("SELECT i FROM IMSInventory i join i.client c join i.outlet o where c.id=:clientId AND i.startPeriod =:startPeriod AND i.endPeriod =:endPeriod ORDER BY o.id")
	List<IMSInventory> retrieveWeeklyInventories(@Param("clientId") Long clientId,  @Param("startPeriod") Date startPeriod, @Param("endPeriod") Date endPeriod);	
	
	@Query("SELECT i FROM IMSInventory i join i.client join i.outlet join i.product where i.period >=  '2016-01-01 00:00:00' AND i.period < '2017-01-01 00:00:00'")
	List<IMSInventory> retrieveAllInventories();
//	SELECT * FROM ims.inventory WHERE inventory_type = 'Daily' AND  inventory_period >=  '2016-01-01 00:00:00' AND inventory_period < '2017-01-01 00:00:00'
	
}
