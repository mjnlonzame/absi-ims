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
	public IMSInventory retrieveInventoryByProductId(Long productId, Date period) {
		return imsInventoryDao.retrieveInventoryByProductId(productId, period);
		
	}

	@Override
	public List<IMSInventory> retrieveInventoriesByProductId(Long productId, List<Date> periods) {
		return imsInventoryDao.retrieveInventoriesByProductId(productId, periods);
	}

	@Override
	public IMSInventory retrieveInventory(Long clientId, Date period) {
		return imsInventoryDao.retrieveInventory(clientId, period);
	}

	@Override
	public List<IMSInventory> retrieveInventories(Long clientId, Date startPeriod, Date endPeriod) {
		return imsInventoryDao.retrieveInventories(clientId, startPeriod, endPeriod);
	}

}
