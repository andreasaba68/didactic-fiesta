package it.asaba.sdev.dockerswarm1;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.htmlunit.webdriver.MockMvcHtmlUnitDriverBuilder;

@RunWith(SpringRunner.class)
@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.DEFINED_PORT)
public class DockerSwarm1ApplicationTests {

  private String baseUrl = "http://127.0.0.1:8080";

  @Autowired
  private MockMvc mockMvc;

  @LocalServerPort
  protected int serverPort;

  private WebDriver driverS1;
  private WebDriver driverS2;

  @Before
  public void setup() {
    System.out.println("DockerSwarm1ApplicationTests.setup() "+serverPort);
    this.driverS1 = MockMvcHtmlUnitDriverBuilder.mockMvcSetup(this.mockMvc).build();
    this.driverS2 = MockMvcHtmlUnitDriverBuilder.mockMvcSetup(this.mockMvc).build();
  }

  @Test
  public void concurrentSessionTest() {
    String testString1 = System.currentTimeMillis()+"@test1";
    String testString2 = System.currentTimeMillis()+"@test2";

    // writes s1 to session 1
    test0(driverS1,testString1);

    // writes s2 to session 2
    test0(driverS2,testString2);

    // expects session 1 to still have s1
    driverS1.get(baseUrl + "/session/read");
    assertEquals(testString1, driverS1.findElement(By.cssSelector("h1")).getText());

    // session must be different anyway (checking the memory address)
    assertNotEquals(driverS1.findElement(By.cssSelector("h3")).getText(),driverS2.findElement(By.cssSelector("h3")).getText());

    // ipaddress or server name
    assertNotEquals(driverS1.findElement(By.cssSelector("h2")).getText(),driverS2.findElement(By.cssSelector("h2")).getText());

  }

  private void test0(WebDriver driver, String testString) {
    driver.get(baseUrl + "/session/write?test="+testString);
    assertEquals(testString, driver.findElement(By.cssSelector("h1")).getText());
  }


}
