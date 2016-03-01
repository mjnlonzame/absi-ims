package com.absi.ims.dao;



import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.absi.ims.domain.IMSOutlet;

@Transactional
public interface IMSOutletDao extends CrudRepository<IMSOutlet, Long> {

}
