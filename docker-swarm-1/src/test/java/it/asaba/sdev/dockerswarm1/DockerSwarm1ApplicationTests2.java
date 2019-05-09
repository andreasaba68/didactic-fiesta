package it.asaba.sdev.dockerswarm1;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

/**
 * e.g. -DbaseUrl=http://127.0.0.1:8081
 * @author Andrea
 *
 */
public class DockerSwarm1ApplicationTests2 {

  private String baseUrl = "http://127.0.0.1:8080"; // anyway it's configured as 8081 so should fail if not changed

  protected WebDriver driverS1;
  protected WebDriver driverS2;

  @Before
  public void setup() {
    String s= System.getProperty("baseUrl");
    if (s!=null) baseUrl= s;
    this.driverS1 = new HtmlUnitDriver();
    this.driverS2 = new HtmlUnitDriver();
  }

  @Test
  public void sillyTest() {
    System.out.println("DockerSwarm1ApplicationTests2.sillyTest() getenv: "+System.getenv("test"));
    System.out.println("DockerSwarm1ApplicationTests2.sillyTest() getProperty: "+System.getProperty("test"));
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

  // mvn test -Dtest=DockerSwarm1ApplicationTests2#testDeployedOn2NodesClusterWOSessionStickness -DbaseUrl=http://<manager's INTERNAL name>:8081
  @Test
  public void testDeployedOn2NodesClusterWOSessionStickness() {
    String testString1 = System.currentTimeMillis()+"@test1";

    test0(driverS1,testString1); // writes s1 to session 1
    String h1= driverS1.findElement(By.cssSelector("h1")).getText();
    String h2= driverS1.findElement(By.cssSelector("h2")).getText();
    String h3= driverS1.findElement(By.cssSelector("h3")).getText();

    // reads from session 1 but expects to fall on the other instance/container so not to be the same session id and server
    driverS1.get(baseUrl + "/session/read");

    // on second node should be ... like ... empty string
    assertNotEquals(h1, driverS1.findElement(By.cssSelector("h1")).getText());

    // ipaddress or server name must be different
    assertNotEquals(h2,driverS2.findElement(By.cssSelector("h2")).getText());

    // session must be different anyway (checking the memory address)
    assertNotEquals(h3,driverS2.findElement(By.cssSelector("h3")).getText());

  }

  private void test0(WebDriver driver, String testString) {
    driver.get(baseUrl + "/session/write?test="+testString);
    assertEquals(testString, driver.findElement(By.cssSelector("h1")).getText());
  }


}
