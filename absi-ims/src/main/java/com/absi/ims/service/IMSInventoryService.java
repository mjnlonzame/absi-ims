package com.absi.ims.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.query.Param;

import com.absi.ims.domain.IMSInventory;

public interface IMSInventoryService {
	void addIMSInventory(IMSInventory imsInventory);

	List<IMSInventory> getAllIMSInventories();

	IMSInventory getIMSInventoryById(Long id);

	void updateIMSInventory(IMSInventory imsInventory);

	void deleteIMSInventory(IMSInventory imsInventory);

	IMSInventory retrieveInventoryByProductId(Long productId, Long outletId, Date period);
	
	List<IMSInventory> retrieveInventoriesByProductId(Long productId, Long outletId,  List<Date> periods);
	
	List<IMSInventory> retrieveDailyInventories(Long clientId, Date period);
	
	List<IMSInventory> retrieveWeeklyInventories(Long clientId, Date startPeriod, Date endPeriod);
	
	List<IMSInventory> retrieveAllInventories();
	
	List<IMSInventory> retrieveFirstInventory(Long productId, Long outletId);
}
