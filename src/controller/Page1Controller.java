package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.Page1Service;

import java.util.List;
import java.util.Map;

@Controller
public class Page1Controller {

    private final Page1Service page1Service;

    @Autowired
    public Page1Controller(Page1Service page1Service) {
        this.page1Service = page1Service;
    }

    @GetMapping("/page1")
    public String showPage1(@RequestParam(value = "action", required = false) String action, Model model) {
        boolean isConnected = page1Service.isDbConnected();
        model.addAttribute("isConnected", isConnected);

        if (!isConnected){
            model.addAttribute("dbStatusMessage", "DB 연결 실패. DB 구성이 완료되지 않았습니다.");
            return "page1";
        }

        model.addAttribute("dbStatusMessage", "DB 연결 성공 (DUMMY 계정)");
            
        // "조회" 버튼이 눌렸을 때 전체 데이터를 가져옵니다.
        if ("search".equals(action)) {
            List<Map<String, Object>> allData = page1Service.getAllDummyData();
            model.addAttribute("page1DataList", allData);
        }

        return "page1";
    }
}