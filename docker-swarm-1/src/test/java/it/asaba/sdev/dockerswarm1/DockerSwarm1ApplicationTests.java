package it.asaba.sdev.dockerswarm1;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.htmlunit.webdriver.MockMvcHtmlUnitDriverBuilder;

@RunWith(SpringRunner.class)
@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.DEFINED_PORT)
public class DockerSwarm1ApplicationTests extends DockerSwarm1ApplicationTests2 {

  @Autowired private MockMvc mockMvc;

  @Before
  public void setup() {
    this.driverS1 = MockMvcHtmlUnitDriverBuilder.mockMvcSetup(this.mockMvc).build();
    this.driverS2 = MockMvcHtmlUnitDriverBuilder.mockMvcSetup(this.mockMvc).build();
  }

  @Test @Override
  public void concurrentSessionTest() {
    super.concurrentSessionTest();
  }

}
