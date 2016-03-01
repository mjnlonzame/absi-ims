package com.absi.ims.service;

import java.util.List;

import com.absi.ims.domain.IMSOutlet;

public interface IMSOutletService {

	void addIMSOutlet(IMSOutlet imsOutlet);

	List<IMSOutlet> getAllIMSOutlets();

	IMSOutlet getIMSOutletById(Long id);

	void updateIMSOutlet(IMSOutlet imsOutlet);

	void deleteIMSOutlet(IMSOutlet imsOutlet);

}
