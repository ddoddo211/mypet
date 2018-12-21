package kr.co.mypet.test;

import static org.junit.Assert.assertTrue;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
//service, dao 에대한 설정파일 필요하다
@ContextConfiguration(locations= {	"classpath:kr/co/mypet/config/spring/root-context.xml",
									"classpath:kr/co/mypet/config/spring/datasource-context.xml",
									"classpath:kr/co/mypet/config/spring/transaction-context.xml"})
//spring 컨테이너를 웹 기반에서 활용 가능 한 WebApplicationContext 로 생성
public class ServiceDaoTestConfig {

//	@Resource(name="datasource")
//	private DataSource datesource;
	
	@Before
	public void rangerSetup() {
		//데이터 초기화
		//delete query 호출 --> sql 스크립트를 실행해주는 녀석
//		ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
//		populator.addScript(new ClassPathResource("kr/or/ddit/config/db/dbInit.sql"));
//		populator.setContinueOnError(false);
//		DatabasePopulatorUtils.execute(populator, datesource);
		
	}
	
	@Ignore
	@Test
	public void test() {
			assertTrue(true);
	}
	

}
