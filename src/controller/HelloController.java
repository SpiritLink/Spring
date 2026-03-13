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

    @GetMapping("/page1")
    public String page1() {
        return "page1";
    }

    @GetMapping("/page2")
    public String page2(Model model) {
        String message = helloService.getGreeting();
        model.addAttribute("message", message);
        return "page2";
    }
}