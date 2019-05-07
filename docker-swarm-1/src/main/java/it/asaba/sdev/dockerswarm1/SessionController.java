package it.asaba.sdev.dockerswarm1;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({"sessionModel"})
public class SessionController {

  @GetMapping("/session/write")
  public String write( SessionModel sessionModel ) throws UnknownHostException {
    sessionModel.setAddress(InetAddress.getLocalHost().getCanonicalHostName());
    sessionModel.setToString(sessionModel.toString());
    return "display";
  }

  @GetMapping("/session/read")
  public String read(SessionModel sessionModel) {
    return "display";
  }

}
