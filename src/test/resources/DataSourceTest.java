import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		location = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class DataSourceTest {
	@Autowired
	private DataSource ds;
	
	@Test
	public void testConnect() throws Exception {
		System.out.println("연결갹체 : "+ds);
		
		connection con = ds.getConnection();
		
		System.out.println("디비연결 성공!");
		System.out.println("con :"+con);
	}
}
