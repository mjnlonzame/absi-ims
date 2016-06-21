package com.absi.ims.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.absi.ims.dao.IMSInventoryDao;
import com.absi.ims.domain.IMSInventory;

@Service
public class IMSInventoryServiceImpl implements IMSInventoryService{

	@Autowired
	private IMSInventoryDao imsInventoryDao;
	
	@Override
	public void addIMSInventory(IMSInventory imsInventory) {

		imsInventoryDao.save(imsInventory);
	}

	@Override
	public List<IMSInventory> getAllIMSInventories() {
		// TODO Auto-generated method stub
		return (List<IMSInventory>) imsInventoryDao.findAll();
	}

	@Override
	public IMSInventory getIMSInventoryById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateIMSInventory(IMSInventory imsInventory) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteIMSInventory(IMSInventory imsInventory) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public IMSInventory retrieveInventoryByProductId(Long productId, Long outletId, Date period) {
		return imsInventoryDao.retrieveInventoryByProductId(productId, outletId, period);
		
	}

	@Override
	public List<IMSInventory> retrieveInventoriesByProductId(Long productId, Long outletId, List<Date> periods) {
		return imsInventoryDao.retrieveInventoriesByProductId(productId, outletId, periods);
	}

	@Override
	public List<IMSInventory> retrieveDailyInventories(Long clientId, Date period) {
		return imsInventoryDao.retrieveDailyInventories(clientId, period);
	}

	@Override
	public List<IMSInventory> retrieveWeeklyInventories(Long clientId, Date startPeriod, Date endPeriod) {
		return imsInventoryDao.retrieveWeeklyInventories(clientId, startPeriod, endPeriod);
	}

	@Override
	public List<IMSInventory> retrieveAllInventories() {
		return imsInventoryDao.retrieveAllInventories();
	}
	
	

}
