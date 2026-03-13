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

    @GetMapping("/page1")
    public String page1(Model model) {
        Page1 data = indexService.getPage1Info();
        data.setNum(200);
        model.addAttribute("page1Data", data);
        return "page1";
    }

    @GetMapping("/page2")
    public String page2(Model model) {
        String message = indexService.getGreeting();
        model.addAttribute("message", message);
        return "page2";
    }
}