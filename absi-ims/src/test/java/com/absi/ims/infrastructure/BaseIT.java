package com.absi.ims.infrastructure;

import org.junit.runner.RunWith;
import org.springframework.boot.test.IntegrationTest;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.absi.ims.AbsiImsApplication;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = AbsiImsApplication.class)
@WebAppConfiguration
@IntegrationTest("server.port:0")
public abstract class BaseIT {

}
