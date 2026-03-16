package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import service.IndexService;
import vo.Page1;

@Controller
public class IndexController {

    private final IndexService indexService;

    @Autowired
    public IndexController(IndexService indexService) {
        this.indexService = indexService;
    }

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/page2")
    public String page2(Model model) {
        String message = indexService.getGreeting();
        model.addAttribute("message", message);
        return "page2";
    }

    @GetMapping("/environment_setup")
    public String environmentSetup() {
        return "environment_setup";
    }
}