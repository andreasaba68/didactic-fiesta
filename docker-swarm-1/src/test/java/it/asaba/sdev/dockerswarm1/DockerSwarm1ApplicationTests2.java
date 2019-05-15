package it.asaba.sdev.dockerswarm1;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.Set;

import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Capabilities;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.openqa.selenium.remote.DesiredCapabilities;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.Page;
import com.gargoylesoftware.htmlunit.WebClient;

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
    assertEquals(h1, driverS1.findElement(By.cssSelector("h1")).getText());

    // ipaddress or server name must be different
    assertNotEquals(h2,driverS2.findElement(By.cssSelector("h2")).getText());

    // session must be different anyway (checking the memory address)
    assertNotEquals(h3,driverS2.findElement(By.cssSelector("h3")).getText());

  }

  @Test
  public void checkLoadBalancerBalances2() throws FailingHttpStatusCodeException, MalformedURLException, IOException, Exception {
    String sessionId= "SESSION";

    try (WebClient webClient = new WebClient()) {
      webClient.addRequestHeader("Connection", "close");

      String testString = System.currentTimeMillis()+"@test";

      Page p = webClient.getPage(baseUrl + "/session/write?test="+testString);
      String h1a= findByElement("h1",p.getWebResponse().getContentAsString());
      System.out.println("ANDREAS: "+webClient.getCookieManager().getCookie(sessionId).getValue());
      com.gargoylesoftware.htmlunit.util.Cookie cookie = webClient.getCookieManager().getCookie(sessionId);

      for (int i = 0; i < 1; i++) {
        // reads from session 1 but expects to fall on the other instance/container so not to be the same session id and server
        webClient.getWebConnection().close();

        String h1b= findByElement("h1",webClient.getPage(baseUrl+ "/session/read").getWebResponse().getContentAsString());
        System.out.println("ANDREAS: "+webClient.getCookieManager().getCookie(sessionId).getValue());

        if (!h1a.equals(h1b))
            return;
      }

      // none of the 10 has been balanced ? really ????
      assertTrue(false);
    }

  }

  private static String findByElement(String element, String page) {
    int pos= page.indexOf("<"+element+">");
    int pos2= page.indexOf("</"+element+">",pos);
    return page.substring(pos+element.length()+2, pos2);
  }

  @Test
  public void checkLoadBalancerBalances() {
    HtmlUnitDriver driver = new HtmlUnitDriver();
    String testString = System.currentTimeMillis()+"@test";

    test0(driver,testString); // writes s to session
    String h1= driver.findElement(By.cssSelector("h1")).getText();

    for (int i = 0; i < 10; i++) {
      // reads from session 1 but expects to fall on the other instance/container so not to be the same session id and server
      driver.get(baseUrl + "/session/read");

      if (!h1.equals(driver.findElement(By.cssSelector("h1")).getText()))
          return;
    }

    // none of the 10 has been balanced ? really ????
    assertTrue(false);

  }

  private void test0(WebDriver driver, String testString) {
    driver.get(baseUrl + "/session/write?test="+testString);
    assertEquals(testString, driver.findElement(By.cssSelector("h1")).getText());
  }


}
