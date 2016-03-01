package com.absi.ims.service;

import java.util.List;

import com.absi.ims.domain.IMSProduct;

public interface IMSProductService {

	void addIMSProduct(IMSProduct imsProduct);

	List<IMSProduct> getAllIMSProducts();

	IMSProduct getIMSProductById(Long id);

	void updateIMSProduct(IMSProduct imsProduct);

	void deleteIMSProduct(IMSProduct imsProduct);
	
	List<IMSProduct> retrieveProductByClient(Long id);

}
