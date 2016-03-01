package com.absi.ims.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.absi.ims.dao.IMSClientDao;
import com.absi.ims.domain.IMSClient;

@Service
public class IMSClientServiceImpl implements IMSClientService {

	@Autowired
	private IMSClientDao imsClientDao;

	@Override
	public void addIMSClient(IMSClient imsClient) {
		imsClientDao.save(imsClient);
	}

	@Override
	public List<IMSClient> getAllIMSClients() {
		return (List<IMSClient>) imsClientDao.findAll();
	}

	@Override
	public IMSClient getIMSClientById(Long id) {
		return imsClientDao.findOne(id);
	}

	@Override
	public void updateIMSClient(IMSClient imsClient) {
		imsClientDao.save(imsClient);
	}

	@Override
	public void deleteIMSClient(IMSClient imsClient) {
		imsClientDao.delete(imsClient);
	}

	@Override
	public List<IMSClient> retrieveClientByOutletId(Long id) {

		return imsClientDao.retrieveClientByOutletId(id);
	}

}
