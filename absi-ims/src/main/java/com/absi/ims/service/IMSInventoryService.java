package com.absi.ims.service;

import java.util.Date;
import java.util.List;

import com.absi.ims.domain.IMSInventory;

public interface IMSInventoryService {
	void addIMSInventory(IMSInventory imsInventory);

	List<IMSInventory> getAllIMSInventories();

	IMSInventory getIMSInventoryById(Long id);

	void updateIMSInventory(IMSInventory imsInventory);

	void deleteIMSInventory(IMSInventory imsInventory);

	IMSInventory retrieveInventoryByProductId(Long productId,  Date period);
	
	List<IMSInventory> retrieveInventoriesByProductId(Long productId,  List<Date> periods);
	
	List<IMSInventory> retrieveDailyInventories(Long clientId, Date period);
	
	List<IMSInventory> retrieveWeeklyInventories(Long clientId, Date startPeriod, Date endPeriod);
}
