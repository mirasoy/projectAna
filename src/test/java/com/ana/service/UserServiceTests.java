package com.ana.service;

import static org.junit.Assert.assertNotNull;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.ana.domain.UserVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserServiceTests {
	
	@Setter(onMethod_= {@Autowired })
	private UserService service;
	
	@Test
	public void testExist() {
		log.info(service);
		
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		UserVO user= new UserVO();
		
		user.setEmail("jiha@naver.com");
		user.setPwd("bimilyiya@");
		
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			user.setUBirthday(beforeFormat.parse("2010/11/11"));
			user.setURegdate(beforeFormat.parse("2020/06/29"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		user.setULastname("Jiha");
		user.setUFstname("Kim");
		user.setFacebookId("");
		user.setGoogleId("");
		user.setUPhone("");
		
		service.register(user);
		log.info("생성된 회원번호: "+user.getUserNum());
		
	}
	
	@Test
	public void testGet() {
		if(service.get("U1") ==null) {
			log.info("********없는 회원입니다!***********");
		}
		else {
			log.info(service.get("U1"));
		}
	}
	
	@Test 
	public void testDelete() {
		log.info("REMOVE RESULT: "+ service.remove("U2"));

	}
	
	@Test
	public void testUpdate() {
		
		UserVO user= service.get("U10");
		
		if(user == null) {
			return;
		}
		
		user.setFacebookId("melong@dsas.com");
		user.setGoogleId("melong@dsas.com");
		log.info("MOODIFY RESULT: "+ service.modify(user));
	}
	
	
	
}
