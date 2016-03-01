package com.absi.ims.dao;



import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.absi.ims.domain.IMSUser;

@Transactional
public interface IMSUserDao extends CrudRepository<IMSUser, Long> {

}
