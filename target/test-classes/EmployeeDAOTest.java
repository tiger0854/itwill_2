import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		location = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class EmployeeDAOTest {
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOTest.class);
	
	@Inject
	private EmployeeDAO edao;
	
	@Test
	
	public void 디비시간정보_조회() throws Exception {
		System.out.println(edao.getTime);
		logger.info(edao.getTime);
	}
}

