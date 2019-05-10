package it.asaba.sdev.dockerswarm1;

import java.io.Serializable;

public class SessionModel implements Serializable {

  private static final long serialVersionUID = -1157779072918745074L;

  private String test= "";
  private String address;
  private String toString;

  public String getTest() {
    return test;
  }

  public void setTest(String test) {
    this.test = test;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getToString() {
    return toString;
  }

  public void setToString(String toString) {
    this.toString = toString;
  }


}
