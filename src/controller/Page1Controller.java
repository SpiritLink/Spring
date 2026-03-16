package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import service.Page1Service;

import java.util.Map;

@Controller
public class Page1Controller {

    private final Page1Service page1Service;

    @Autowired
    public Page1Controller(Page1Service page1Service) {
        this.page1Service = page1Service;
    }

    @GetMapping("/page1")
    public String showPage1(Model model) {
        boolean isConnected = page1Service.isDbConnected();
        model.addAttribute("isConnected", isConnected);
        
        if (isConnected) {
            model.addAttribute("dbStatusMessage", "DB 연결 성공 (DUMMY 계정)");
            Map<String, Object> data = page1Service.getDummyData();
            if (data != null && data.get("title") != null) {
                model.addAttribute("page1Data", data);
            }
        } else {
            model.addAttribute("dbStatusMessage", "DB 연결 실패. DB 구성이 완료되지 않았습니다.");
        }
        
        return "page1";
    }
}