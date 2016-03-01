package com.absi.ims.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.absi.ims.dao.IMSProductDao;
import com.absi.ims.domain.IMSProduct;

@Service
public class IMSProductServiceImpl implements IMSProductService {

	@Autowired
	private IMSProductDao imsProductDao;

	@Override
	public void addIMSProduct(IMSProduct imsProduct) {
		imsProductDao.save(imsProduct);
	}

	@Override
	public List<IMSProduct> getAllIMSProducts() {
		return (List<IMSProduct>) imsProductDao.findAll();
	}

	@Override
	public IMSProduct getIMSProductById(Long id) {
		return imsProductDao.findOne(id);
	}

	@Override
	public void updateIMSProduct(IMSProduct imsProduct) {
		imsProductDao.save(imsProduct);
	}

	@Override
	public void deleteIMSProduct(IMSProduct imsProduct) {
		imsProductDao.delete(imsProduct);
	}

	@Override
	public List<IMSProduct> retrieveProductByClient(Long id) {
		return imsProductDao.retrieveProductByClientId(id);
	}
	
}
