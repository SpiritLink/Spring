package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import service.HelloService;

@Controller
public class HelloController {

    private final HelloService helloService;

    @Autowired
    public HelloController(HelloService helloService) {
        this.helloService = helloService;
    }

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/hello")
    public String hello(Model model) {
        String message = helloService.getGreeting();
        model.addAttribute("message", message);
        return "hello";
    }
}