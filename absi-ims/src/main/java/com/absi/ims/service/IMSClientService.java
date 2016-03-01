package com.absi.ims.service;

import java.util.List;

import com.absi.ims.domain.IMSClient;

public interface IMSClientService {
	void addIMSClient(IMSClient imsClient);

	List<IMSClient> getAllIMSClients();

	IMSClient getIMSClientById(Long id);

	void updateIMSClient(IMSClient imsClient);

	void deleteIMSClient(IMSClient imsClient);
	
	List<IMSClient> retrieveClientByOutletId(Long id);
}
